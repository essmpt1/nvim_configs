local opt = vim.opt
-- Opções de exibição
opt.number = true              -- Exibir números de linha
opt.cursorline = true          -- Destacar linha do cursor
opt.colorcolumn = "81"         -- Linha guia na coluna 81
opt.showmatch = true           -- Destacar pares de parênteses

-- Busca
opt.hlsearch = true            -- Destacar resultados da busca
opt.incsearch = true           -- Busca incremental

-- Mouse
opt.mouse = "a"                -- Habilitar uso do mouse

-- Tabulação e indentação
opt.tabstop = 4                -- Número de espaços por tab
opt.shiftwidth = 4             -- Recuo automático
opt.softtabstop = 4            -- Espaços simulando tab
opt.expandtab = false          -- Não converter tab em espaços
opt.smartindent = true         -- Indentação automática inteligente

vim.diagnostic.config({
	virtual_text = true, -- Mostra diagnósticos diretamente no código
	signs = true,        -- Mostra ícones na coluna lateral
	underline = true,    -- Sublinhar erros e avisos
	update_in_insert = false, -- Não mostrar diagnósticos enquanto digita
})
