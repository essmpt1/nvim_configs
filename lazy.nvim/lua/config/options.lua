local opt = vim.opt
-- Opções de exibição
opt.number = true              -- Exibir números de linha
-- opt.relativenumber = true      -- Mostra números relativos nas outras linhas (útil para navegar com k/j).
opt.cursorline = true          -- Destacar linha do cursor
opt.colorcolumn = "81"         -- Linha guia na coluna 81
opt.showmatch = true           -- Destacar pares de parênteses

-- Comportamento de janelas
opt.splitright = true          -- Novas janelas verticais abrem à direita
opt.splitbelow = true          -- Novas janelas horizontais abrem em baixo
opt.scrolloff = 4              -- Mantém 4 linhas de margem ao rolar o cursor
opt.sidescrolloff = 8          -- Margem horizontal ao rolar lateralmente
opt.winminwidth = 5            -- Largura mínima de uma janela ao dividi-la

-- Busca
opt.hlsearch = true            -- Destacar resultados da busca
opt.incsearch = true           -- Busca incremental
opt.ignorecase = true          -- Busca ignora maiúsculas/minúsculas.
opt.smartcase = true           -- Se usar maiúsculas, a busca passa a ser sensível.
opt.inccommand = "nosplit"     -- Mostra substituição (:s/…) em tempo real.

-- Mouse
opt.mouse = "a"                -- Habilitar uso do mouse

-- Tabulação e indentação para a 42
opt.tabstop = 4                -- Número de espaços por tab
opt.shiftwidth = 4             -- Recuo automático
opt.softtabstop = 4            -- Espaços simulando tab
opt.expandtab = false          -- Não converter tab em espaços
opt.smartindent = true         -- Indentação automática inteligente
opt.autoindent = true          -- Copia a indentação da linha anterior
opt.shiftround = true          -- Arredonda indentação para múltiplos de shiftwidth

-- Tempo de espera para mapeamentos compostos (como <Leader>)
opt.timeout = true             -- Ativar espera para combinações de teclas
opt.timeoutlen = 300           -- Tempo máximo (ms) entre teclas de um atalho
opt.updatetime = 500           -- tempo para aparecer o buffer das funções

opt.showmode = false -- Não amostra a statusline do neovim

vim.diagnostic.config({
	virtual_text = true,      -- Mostra diagnósticos diretamente no código
	signs = true,             -- Mostra ícones na coluna lateral
	underline = true,         -- Sublinhar erros e avisos
	update_in_insert = false, -- Não mostrar diagnósticos enquanto digita
})

-- Melhor autocomplete e popup
opt.completeopt = "menu,menuone,noselect"  -- Melhora a UX do menu de autocomplete
opt.pumheight = 10                         -- Limita altura do menu popup.
opt.pumblend = 10                          -- Transparência do menu popup.

-- Configuração do tema
opt.background = "dark"           -- "light" "dark"
opt.termguicolors = true          -- True color support
vim.cmd.colorscheme("tokyonight") -- "tokyonight" "gruvbox-material"
