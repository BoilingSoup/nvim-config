vim.g.mapleader = " "

local keymap = vim.keymap

-- shorten timeoutlen only for jk | kj <Esc> without effecting other keybinds
-- jk saves, kj does not
vim.cmd([[
  let g:esc_j_lasttime = 0
  let g:esc_k_lasttime = 0
  function! JKescape(key)
    if a:key=='j' | let g:esc_j_lasttime = reltimefloat(reltime()) | endif
    if a:key=='k' | let g:esc_k_lasttime = reltimefloat(reltime()) | endif
    let l:timediff = abs(g:esc_j_lasttime - g:esc_k_lasttime)
    return (l:timediff <= 0.1 && l:timediff >=0.001) ? a:key=='k' ? "\b\e:w\<CR>" : "\b\e" : a:key
  endfunction
  inoremap <expr> j JKescape('j')
  inoremap <expr> k JKescape('k')
]])

-- keymap.set("i", "jk", "<ESC>:w<CR>")
-- keymap.set("i", "kj", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- toggleterm
keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>")

-- bufferline
keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
keymap.set("n", "<leader>c", "<cmd>bd<CR>")
