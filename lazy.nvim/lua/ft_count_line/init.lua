local M = {}
local ns_id = vim.api.nvim_create_namespace("ft_count_line")

local function is_function_node(node)
	return node:type() == "function_definition"
end

local function count_function_lines(node)
	local body = node:field("body")[1]
	if not body then return 0 end
	local start_row, _, end_row, _ = body:range()
	return math.max(0, end_row - start_row - 1)
end

local function get_function_name(node)
	local declarator = node:field("declarator")[1]
	if not declarator then return "<anônima>" end
	return vim.treesitter.get_node_text(declarator, 0):match("([%w_]+)%s*%(") or "<desconhecida>"
end

function M.show_virtual_text()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)

	local ft = vim.bo.filetype
	local lang = vim.treesitter.language.get_lang(ft)
	local parser = vim.treesitter.get_parser(bufnr, lang)
	local tree = parser:parse()[1]
	local root = tree:root()

	for node in root:iter_children() do
	if is_function_node(node) then
		local name = get_function_name(node)
		local lines = count_function_lines(node)
		local _, _, end_row, _ = node:range()
		local msg = string.format("↳ '%s' tem %d linhas", name, lines)

		vim.api.nvim_buf_set_extmark(bufnr, ns_id, end_row, 0, {
		virt_text = { { msg, "Comment" } },
		virt_text_pos = "eol",
		})
	end
	end
end

return M
