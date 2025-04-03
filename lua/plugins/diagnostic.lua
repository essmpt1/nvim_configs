vim.diagnostic.config({
	virtual_text = true, -- Mostra diagnósticos diretamente no código
	signs = true,        -- Mostra ícones na coluna lateral
	underline = true,    -- Sublinhar erros e avisos
	update_in_insert = false, -- Não mostrar diagnósticos enquanto digita
})

