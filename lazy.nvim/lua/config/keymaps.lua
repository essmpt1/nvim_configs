local wk = require("which-key")

wk.add({
	{"<leader>d", group = "debug"},
	{"<leader>t", group = "terminal"},
	{"<leader>4", group = "42"},
	{"<leader>f", group = "telescope"},
	{"<leader>g", group = "diffview"},
	{"<leader>l", group = "documentação LSP"},
})

-- Keymaps para terminal
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { silent = true, desc = "Abrir terminal no modo float" })
vim.keymap.set("n", "<Leader>th", ":ToggleTerm direction=horizontal<CR>", { silent = true, desc = "Abrir terminal no modo horizontal" })
vim.keymap.set("n", "<Leader>tv", ":ToggleTerm direction=vertical<CR>", { silent = true, desc = "Abrir terminal no modo vertical" })

-- Keymaps para o debug
vim.keymap.set('n', '<leader>dc', function() require("dap").continue() end, { desc = "Iniciar/Continuar debug" })
vim.keymap.set('n', '<leader>ds', function() require("dap").step_over() end, { desc = "Step over" })
vim.keymap.set('n', '<leader>di', function() require("dap").step_into() end, { desc = "Step into" })
vim.keymap.set('n', '<leader>do', function() require("dap").step_out() end, { desc = "Step out" })
vim.keymap.set('n', '<leader>db', function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })
vim.keymap.set('n', '<leader>dB', function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Breakpoint condicional" })
vim.keymap.set('n', '<leader>du', function() require("dapui").toggle() end, { desc = "Toggle UI do debugger" })
vim.keymap.set('n', '<leader>dq', function() require("dap").terminate() end, { desc = "Terminar debug" })
vim.keymap.set('n', '<leader>dr', function()
	require("dap").terminate()
	require("dapui").close()
	require("dap").clear_breakpoints()
end, { desc = "Resetar sessão de debug" })

-- Keymaps da 42
vim.keymap.set("n", "<leader>4f", ":CFormatter42<CR>", { desc = "Formatar com 42 formatter" })
vim.keymap.set("n", "<leader>4h", ":Stdheader<CR>", { desc = "Coloca o header da 42" })

-- Keymaps para o telescope
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<cr>', { desc = 'Procurar ficheiros' })
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<cr>', { desc = 'Grep nos ficheiros' })
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<cr>', { desc = 'Listar buffers' })
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<cr>', { desc = 'Procurar ajuda' })
vim.keymap.set('n', '<leader>gc', ':Telescope git_commits<cr>', { silent = true, desc="Histórico de commits do repositório" })

-- Keymaps para o diffview
vim.keymap.set('n', '<leader>gf', ':DiffviewFileHistory %<CR>', { silent = true, desc="Histórico de commits do arquivo atual" })
vim.keymap.set('n', '<leader>gd', ':DiffviewOpen<CR>', { silent = true, desc="Abrir visualização detalhada de diffs" })
vim.keymap.set('n', '<leader>gq', ':DiffviewClose<CR>', { silent = true, desc="Fechar a visualização do Diffview" })

-- Keymaps para ver a documentação do LSP
vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { silent = true, desc = "Ir para a definição" })
vim.keymap.set('n', '<leader>lk', vim.lsp.buf.hover, { silent = true, desc = "Mostrar documentação do símbolo" })
vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename, { silent = true, desc = "Renomear símbolo" })
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { silent = true, desc = "Ações de código" })

vim.keymap.set("n", "<C-p>", ":edit $MYVIMRC<CR>", { desc = "Editar Vimrc" })
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true, desc = "Abrir tree de ficheiros" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { silent = true, desc = "Sair do modo terminal para normal" })
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { silent = true, desc = "Mover para a janela à esquerda (terminal)" })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { silent = true, desc = "Mover para a janela abaixo (terminal)" })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { silent = true, desc = "Mover para a janela acima (terminal)" })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { silent = true, desc = "Mover para a janela à direita (terminal)" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true, desc = "Mover para a janela à esquerda" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true, desc = "Mover para a janela abaixo" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true, desc = "Mover para a janela acima" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true, desc = "Mover para a janela à direita" })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true, desc = "Próximo buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { silent = true, desc = "Buffer anterior" })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true, desc = "Mover linha para baixo" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true, desc = "Mover linha para cima" })
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==i", { silent = true, desc = "Mover linha para baixo (modo insert)" })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==i", { silent = true, desc = "Mover linha para cima (modo insert)" })

