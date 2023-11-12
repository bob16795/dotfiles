vim.opt.guifont = "CaskaydiaCove NFP:h12"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("packer").startup(function(use)
    -- Packer can manage itself
    use 'NoahTheDuke/vim-just'
    use 'wbthomason/packer.nvim'
    use 'glepnir/dashboard-nvim'
    use 'nvim-tree/nvim-tree.lua'
    use 'jiangmiao/auto-pairs'
    use 'Shougo/neocomplcache.vim'
    use 'alaviss/nim.nvim'
    use 'farmergreg/vim-lastplace'
    use 'ctrlpvim/ctrlp.vim'
    use 'vimwiki/vimwiki'
    use 'bob16795/markup.vim'
    use 'vim-scripts/LargeFile'
    use 'dradtke/VIP'
    use 'Shougo/neocomplcache'
    use 'neovim/nvim-lspconfig'
    use { 'dracula/vim', as = 'dracula' }
    use 'noahfrederick/vim-noctu'
    use 'terryma/vim-multiple-cursors'
    use 'ojroques/vim-scrollstatus'
    use 'idbrii/vim-unityengine'
    use 'OmniSharp/omnisharp-vim'
    use 'nanotee/zoxide.vim'
    use 'nvim-neorg/neorg'
    use 'wakatime/vim-wakatime'
    use 'nvim-lua/plenary.nvim'
    use 'folke/todo-comments.nvim'
    use 'onsails/lspkind.nvim'
    use 'sainnhe/everforest'
    use 'arcticicestudio/nord-vim'
    use 'airblade/vim-gitgutter'

    use 'vim-test/vim-test'
    use 'vim-scripts/OmniCppComplete'
    use 'tpope/vim-fugitive'
    use 'nvim-tree/nvim-web-devicons'

    use 'nvim-telescope/telescope.nvim'
    use 'romgrk/barbar.nvim'

    use 'pwntester/octo.nvim'
    use 'andweeb/presence.nvim'
    use 'junegunn/goyo.vim'
    use { 'yoshio15/vim-trello', branch = 'main' }
    use 'MarcWeber/vim-addon-mw-utils'
    use 'tomtom/tlib_vim'
    use 'ziglang/zig.vim'
    use 'ahmedkhalf/project.nvim'
    use 'nvim-lua/lsp-status.nvim'
    use 'brenoprata10/nvim-highlight-colors'
    use "akinsho/toggleterm.nvim"
end)

require 'user.reload'

require("toggleterm").setup {
    direction = 'vertical'
}

require('nvim-tree').setup {

}

require('barbar').setup {
    sidebar_filetypes = {
        NvimTree = true,
    }
}

require('project_nvim').setup {}

require('nvim-highlight-colors').setup {}

local lsp_status = require('lsp-status')

lsp_status.config({
    indicator_errors = 'E',
    indicator_warnings = 'W',
    indicator_info = 'i',
    indicator_hint = '?',
    indicator_ok = 'Ok',
})

local lspconfig = require('lspconfig')
lspconfig.zls.setup {
    on_attach = lsp_status.on_attach,
    capabilities = lsp_status.capabilities
}
lspconfig.rust_analyzer.setup {
    on_attach = lsp_status.on_attach,
    capabilities = lsp_status.capabilities
}
lspconfig.lua_ls.setup {
    on_attach = lsp_status.on_attach,
    capabilities = lsp_status.capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gr', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})


local db = require("dashboard")

db.setup({
    theme = 'hyper',
    config = {
        week_header = {
            enable = true,
        },
        shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'PackerUpdate', key = 'u' },
            {
                icon = ' ',
                icon_hl = '@variable',
                desc = 'Files',
                group = 'Label',
                action = 'Telescope find_files',
                key = 'f',
            },
            {
                desc = ' Projects',
                group = 'DiagnosticHint',
                action = 'Telescope projects',
                key = 'p',
            },
        },
    },
})

require("telescope").setup()
require('telescope').load_extension('projects')
require("octo").setup()
require("todo-comments").setup()
require("presence"):setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
    client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = true,                       -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static ghable (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)

    -- Rich Presence text options
    editing_text        = "Editing %s",         -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",        -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",   -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",         -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",      -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",  -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})

vim.api.nvim_set_var('s:using_snippets', 1)

vim.cmd([[
syntax enable
syntax on
filetype plugin indent on
colorscheme mondo

function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

set statusline =
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%1*%{&ff}%*            "file format
set statusline +=%1*%y%*                "file type
set statusline +=%1*\ %<%F%*            "full path
set statusline +=%1*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%1*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%1*%{LspStatus()}

autocmd BufWritePre * lua vim.lsp.buf.format()

augroup dirchange
    autocmd!
    autocmd DirChanged * let &titlestring=v:event['cwd']
augroup END

nnoremap <S-ScrollWheelUp> <ScrollWheelLeft>
nnoremap <S-2-ScrollWheelUp> <2-ScrollWheelLeft>
nnoremap <S-3-ScrollWheelUp> <3-ScrollWheelLeft>
nnoremap <S-4-ScrollWheelUp> <4-ScrollWheelLeft>
nnoremap <S-ScrollWheelDown> <ScrollWheelRight>
nnoremap <S-2-ScrollWheelDown> <2-ScrollWheelRight>
nnoremap <S-3-ScrollWheelDown> <3-ScrollWheelRight>
nnoremap <S-4-ScrollWheelDown> <4-ScrollWheelRight>

inoremap <S-ScrollWheelUp> <ScrollWheelLeft>
inoremap <S-2-ScrollWheelUp> <2-ScrollWheelLeft>
inoremap <S-3-ScrollWheelUp> <3-ScrollWheelLeft>
inoremap <S-4-ScrollWheelUp> <4-ScrollWheelLeft>
inoremap <S-ScrollWheelDown> <ScrollWheelRight>
inoremap <S-2-ScrollWheelDown> <2-ScrollWheelRight>
inoremap <S-3-ScrollWheelDown> <3-ScrollWheelRight>
inoremap <S-4-ScrollWheelDown> <4-ScrollWheelRight>

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
]])

-- The function is called `t` for `termcodes`.
-- You don't have to call it that, but I find the terseness convenient
local function t(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t '<C-n>'
    else
        return t '<Tab>'
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t '<C-p>'
    else
        return t '<C-h>'
    end
end

-- line numbers
vim.opt.number = true

vim.opt.completeopt = "menuone,noinsert,noselect"

-- leader key
vim.g.mapleader = " "

-- neovide
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_floating_opacity = 0

-- sign
vim.opt.signcolumn = "yes"

-- title
vim.opt.title = true

-- zig config
vim.g.zig_fmt_autosave = true

-- compat stuff idk
vim.opt.compatible = false

-- indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.laststatus = 2
vim.opt.wrap = false

-- undo
vim.opt.undofile = true
vim.opt.undodir = "/home/john/.config/nvim/undo"

-- disable folding bc im smart
vim.opt.foldenable = false
vim.opt.numberwidth = 2

-- mouse
vim.opt.mouse = 'a'

-- font
vim.opt.syntax = "on"

-- styiling
vim.opt.fillchars = "vert:▎"

-- bamba
vim.api.nvim_create_autocmd('BufRead,BufNewFile', {
    pattern = { '*.bam' },
    callback = function()
        vim.opt.syntax = 'bamba'
    end,
})

-- Binds

local map = vim.api.nvim_set_keymap

local options = { noremap = true }

map('n', '<leader>gg', '<cmd>Git<cr>', options)
map('n', '<leader>gb', '<cmd>Git blame<cr>', options)

map('n', '<leader>tp', ':Telescope projects<cr>', options)
map('n', '<leader>tf', ':Telescope fd<cr>', options)
map('n', '<leader>td', ':TodoTelescope<cr>', options)

map('n', '<leader>rr', '<cmd>lua ReloadConfig()<cr>', options)
map('n', '<leader>n', ':NvimTreeToggle<cr>', options)
map('n', '<leader>t', ':ToggleTerm<cr>', options)
