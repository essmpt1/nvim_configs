vim.keymap.set("n", "<C-p>", ":edit $MYVIMRC<CR>", { desc = "Editar Vimrc" })
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true, desc = "Abrir tree de ficheiros" })
vim.keymap.set("n", "<C-t>", ":ToggleTerm direction=float<CR>", { silent = true, desc = "Abrir terminal no modo float" })
vim.keymap.set("n", "<Leader>th", ":ToggleTerm direction=horizontal<CR>", { silent = true, desc = "Abrir terminal no modo horizontal" })
vim.keymap.set("n", "<Leader>tv", ":ToggleTerm direction=vertical<CR>", { silent = true, desc = "Abrir terminal no modo vertical" })
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

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { silent = true, desc = "Ir para a definição" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true, desc = "Mostrar documentação do símbolo" })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { silent = true, desc = "Renomear símbolo" })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { silent = true, desc = "Ações de código" })

vim.keymap.set('n', '<leader>gc', ':Telescope git_commits<CR>', { silent = true, desc="Histórico de commits do repositório" })
vim.keymap.set('n', '<leader>gf', ':DiffviewFileHistory %<CR>', { silent = true, desc="Histórico de commits do arquivo atual" })
vim.keymap.set('n', '<leader>gd', ':DiffviewOpen<CR>', { silent = true, desc="Abrir visualização detalhada de diffs" })
vim.keymap.set('n', '<leader>gq', ':DiffviewClose<CR>', { silent = true, desc="Fechar a visualização do Diffview" })

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { silent = true, desc = "Ir para a definição" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true, desc = "Mostrar documentação do símbolo" })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { silent = true, desc = "Renomear símbolo" })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { silent = true, desc = "Ações de código" })

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Procurar ficheiros' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Grep nos ficheiros' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Listar buffers' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Procurar ajuda' })
