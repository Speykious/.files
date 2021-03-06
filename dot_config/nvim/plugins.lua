vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	-- Various LSP and other programming-related plugins
	use 'neovim/nvim-lspconfig'
	use 'nvim-lua/completion-nvim'
	use 'nvim-lua/lsp_extensions.nvim'
	use 'honza/vim-snippets'
	use 'jiangmiao/auto-pairs'
	use 'tpope/vim-commentary'
  use { 'mg979/vim-visual-multi', branch = 'master' }
  use 'jbyuki/instant.nvim'
  use 'tpope/vim-surround'
  use 'simrat39/rust-tools.nvim'
  use 'kchmck/vim-coffee-script'
  use 'dag/vim-fish'
  use 'mfussenegger/nvim-jdtls'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'mhinz/vim-signify'
  use 'tpope/vim-fugitive'

	-- Metaplugins for Neovim
  use 'glepnir/dashboard-nvim'
  use { 'tpope/vim-dispatch', opt = true, cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }
	use 'tweekmonster/startuptime.vim'
  use 'kyazdani42/nvim-web-devicons'
  use 'romgrk/barbar.nvim'
  use 'kyazdani42/nvim-tree.lua'
	use 'itchyny/lightline.vim'
  use 'Speykious/simp.vim'
end)

-- Treesitter configuration
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "c",
    "css",
    "fish",
    "haskell",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "latex",
    "lua",
    "python",
    "regex",
    "rust",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "yaml",
  },
  -- ignore_install = { "..." },
  highlight = {
    enable = true,
    -- disable = { "..." },
  },
}

-- Neovim Native LSP configuration
local nvim_lsp = require('lspconfig')
local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', ';D', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', ';d', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', ';h', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', ';i', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', ';s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', ';t', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', ';a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', ';r', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', ';e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', ';<', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ';>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<leader>q',  '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', ';f',  '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      -- disable virtual text
      virtual_text = true,

      -- configure sign display | see: ":help vim.lsp.diagnostic.set_signs()"
      signs = true,
      update_in_insert = true,
    }
  )

  require('completion').on_attach()
end

-- Language servers
local servers = {
  "bashls",
  "ccls",
  "cmake",
  "cssls",
  "hls",
  "html",
  "jsonls",
  "pyright",
  "rls",
  "rust_analyzer",
  "sqlls",
  "tsserver",
  "vimls",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

local lspconfig = require'lspconfig'
local pid = vim.fn.getpid()
lspconfig.omnisharp.setup {
    cmd = { "omnisharp", "--languageserver" , "--hostPID", tostring(pid) },
    on_attach = on_attach,
}
