" Set this to 1 to use ultisnips for snippet handling
let s:using_snippets = 1
" auto-install vim-plug

call plug#begin('~/.config/nvim/autoload/plugged')
    
    Plug 'glepnir/dashboard-nvim' 
    Plug 'preservim/nerdtree'
    Plug 'jiangmiao/auto-pairs'
    Plug 'Shougo/neocomplcache.vim'
    Plug 'alaviss/nim.nvim'
    Plug 'scrooloose/syntastic'
    Plug 'farmergreg/vim-lastplace'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'vimwiki/vimwiki'
    Plug 'bob16795/markup.vim'
    Plug 'vim-scripts/LargeFile'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }    
    Plug 'dradtke/VIP'
    Plug 'Shougo/neocomplcache'
    Plug 'neovim/nvim-lspconfig'
    Plug 'dracula/vim', {'name': 'dracula'}
    Plug 'noahfrederick/vim-noctu'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'ojroques/vim-scrollstatus'
    Plug 'idbrii/vim-unityengine'
    Plug 'OmniSharp/omnisharp-vim'  
    Plug 'nanotee/zoxide.vim'
    Plug 'nvim-neorg/neorg'
    "Plug 'akinsho/toggleterm.nvim', {'tag': 'v1.*'} 
    Plug 'wakatime/vim-wakatime'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'folke/todo-comments.nvim'
    Plug 'onsails/lspkind.nvim'
    Plug 'sainnhe/everforest'
    Plug 'arcticicestudio/nord-vim'
    Plug 'airblade/vim-gitgutter'

    "Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'

    Plug 'lambdalisue/battery.vim'
    Plug 'vim-test/vim-test'
    Plug 'vim-scripts/OmniCppComplete'
    "Plug 'akinsho/bufferline.nvim'
    Plug 'kyazdani42/nvim-web-devicons'

    Plug 'nvim-telescope/telescope.nvim'


    Plug 'pwntester/octo.nvim'
    "Plug 'yggdroot/indentline'
    Plug 'andweeb/presence.nvim'
    Plug 'junegunn/goyo.vim'
    Plug 'yoshio15/vim-trello', { 'branch': 'main' }
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    "Plug 'natecraddock/sessions.nvim'
    Plug 'ziglang/zig.vim'
    Plug 'ahmedkhalf/project.nvim'

call plug#end()

let g:syntastic_cpp_include_dirs = ["library"]

syntax enable
syntax on
set nocompatible
"set completeopt=longest,menuone

lua << EOF

require("project_nvim").setup{}
local lspconfig = require('lspconfig')
lspconfig.zls.setup {}
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

db.custom_center = {
  {icon = '  ',
  desc = 'Recently latest session                  ',
  shortcut = 'SPC s l',
  action ='SessionsLoad'},
  {icon = '  ',
  desc = 'Recently opened files                   ',
  action =  'DashboardFindHistory',
  shortcut = 'SPC f h'},
  {icon = '  ',
  desc = 'Find  File                              ',
  action = 'Telescope find_files find_command=rg,--hidden,--files',
  shortcut = 'SPC f f'},
  {icon = '  ',
  desc ='File Browser                            ',
  action =  'Telescope file_browser',
  shortcut = 'SPC f b'},  
}
--require("toggleterm").setup()
require("telescope").setup()
require('telescope').load_extension('projects')
require("octo").setup()
require("todo-comments").setup()
-- require("bufferline").setup{
--   options = {
--     offsets = {
--       {
--         filetype = "nerdtree",
--         text = function()
--           return vim.fn.getcwd()
--         end,
--         highlight = "Directory",
--         text_align = "left"
--       },
--     },
--     show_buffer_icons = true,
--     separator_style = "slant",
--   },
--   highlights = {
--     fill = {
--       ctermbg = 0,
--       ctermfg = 255,
--     },
--     background = {
--       ctermbg = 254,
--       ctermfg = 255,
--     },
--     separator = {
--       ctermbg = 254,
--       ctermfg = 0,
--     },
--     separator_selected = {
--       ctermbg = 252,
--       ctermfg = 0,
--     },
--     separator_visible = {
--       ctermbg = 254,
--       ctermfg = 0,
--     },
--     buffer_selected = {
--       ctermbg = 252,
--       ctermfg = 253,
--     },
--     buffer_visible = {
--       ctermbg = 254,
--       ctermfg = 255,
--     },
--     close_button = {
--       ctermbg = 254,
--       ctermfg = 255,
--     },
--     indicator_selected = {
--       ctermbg = 252,
--       ctermfg = 252,
--     },
--     close_button_selected = {
--       ctermbg = 252,
--       ctermfg = 253,
--     },
--     close_button_visible = {
--       ctermbg = 254,
--       ctermfg = 255,
--     },
--   },
-- }
require("presence"):setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
    client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = true,                      -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = true,                     -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})
EOF

filetype plugin indent on
" set leader to space
let mapleader = " "
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
set laststatus=2
" enable mouse because why not
set mouse=a
" apply markdown formatting to markup files
autocmd BufNewFile,BufRead *.mu set ft=markup
autocmd filetype cpp set tabstop=4
autocmd filetype cpp set softtabstop=4
autocmd filetype cpp set shiftwidth=4
" status line
set statusline =
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%1*%{&ff}%*            "file format
set statusline +=%1*%y%*                "file type
set statusline +=%1*\ %<%F%*            "full path
set statusline +=%1*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%1*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
" save undo
set undofile
set undodir=$HOME/.config/nvim/undo
" disable folding
set nofoldenable
" line numbers
set number relativenumber
set numberwidth=2
" theme
" set t_Co=256
colorscheme mondo
" hi PreProc ctermfg=white

" vimwiki config
let g:vimwiki_list = [{'path': '~/doc/not/'}]

" syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:OmniSharp_server_use_mono = 1
let g:syntastic_c_checkers = [ 'make']
let g:syntastic_cs_checkers = [ 'code_checker']

" ctrl p binds
nnoremap <leader>. :CtrlPTag<cr>
map <F11> :let g:neovide_fullscreen=1<cr>

" nim ctags
au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'nim',
    \ 'whitelist': ['nim'],
    \ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}
    \ })
"    

let s:nimlspexecutable = "nimlsp"
au User lsp_setup call lsp#register_server({
\ 'name': 'nimlsp',
\ 'cmd': {server_info->[s:nimlspexecutable]},
\ 'whitelist': ['nim'],
\ })

let g:tagbar_type_nim = {
    \ 'ctagstype': 'nim',
    \ 'kinds' : [
        \'c:classes',
        \'e:enums',
        \'t:tuples',
        \'r:subranges',
        \'P:proctypes',
        \'p:procedures',
        \'m:methods',
        \'o:operators',
        \'T:templates',
        \'M:macros'
    \ ]
\}
" auto reload vim rc
augroup myvimrc
    au!
    au BufWritePost init.vim,.vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
" large file limit
let g:LargeFile=1
" vim include c headers
let s:extpaths=expand("$HOME/.config/nvim/extpaths")
if filereadable(s:extpaths)
    execute "source ".s:extpaths
endif
set path+=/usr/include/freetype2/**2
set path+=/usr/X11R6/include/**2
" omnisharp
let g:OmniSharp_popup_position = 'peek'
if has('nvim')
  let g:OmniSharp_popup_options = {
  \ 'winhl': 'Normal:NormalFloat'
  \}
else
  let g:OmniSharp_popup_options = {
  \ 'highlight': 'Normal',
  \ 'padding': [0, 0, 0, 0],
  \ 'border': [1]
  \}
endif
let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'pageDown': ['<C-f>', '<PageDown>'],
\ 'pageUp': ['<C-b>', '<PageUp>']
\}

if s:using_snippets
  let g:OmniSharp_want_snippet = 1
endif

let g:OmniSharp_highlight_groups = {
\ 'ExcludedCode': 'NonText'
\}

map <F5> :TermExec cmd='./run.sh'<Return>
map <F6> :!./run.sh<Return>
hi SpellBad cterm=bold ctermfg=red ctermbg=0
hi SpellCap cterm=bold ctermfg=blue ctermbg=0
hi VertSplit cterm=bold
hi CursorLine cterm=none
hi EndOfBuffer ctermfg=black
hi Normal ctermbg=0
hi Statement ctermfg=darkgreen
hi Identifier ctermfg=none cterm=none
hi nimSugGlobalVar ctermfg=red
hi LineNr ctermfg=none
hi SignColumn ctermbg=none ctermfg=darkblue
hi TodoSignTODO ctermfg=darkblue
hi Visual ctermbg=252 ctermfg=253
hi Title ctermfg=none
hi nimInclude ctermfg=3

let g:minimap_width = 20 
let g:minimap_auto_start = 1 
let g:minimap_git_colors = 1 
let g:deoplete#enable_at_startup = 1
let g:colorizer_fgcontrast=1

autocmd FileType markup set makeprg=markup_comp\ %

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" other plugin before putting this into your config.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:startify_enable_special      = 0
let g:startify_files_number        = 10
let g:startify_relative_path       = 1
let g:startify_change_to_dir       = 1
let g:startify_update_oldfiles     = 1
let g:startify_session_autoload    = 1
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
set fillchars+=vert:▏
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>c :ToggleTerm<CR>
map <f9> :make<cr>
map <f8> :make clean<cr>
" Start NERDTree when Vim is started without file arguments.

if filereadable(expand('project.vim'))
  exe 'source project.vim'
endif

set guifont=Cascadia\ Code\ PL:h14

let NERDTreeMapOpenInTab='\r'
command! W  write

function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction
map gm :call SynStack()<CR>

let g:airline_theme='mondo'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:vimTrelloApiKey = '55d570771121c20fc66ac091b7246f94'
let g:vimTrelloToken = '857c73247f86821fb99981d2fa88976552ae7ab140ab57b3a85961368e32d7cb'
set scrolljump=0
autocmd BufRead,BufNewFile *.slm set filetype=slim
if exists("g:neovide")
  colorscheme nord
endif

let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:zig_fmt_autosave = 1
let g:neovide_padding_top = 30
let g:neovide_padding_left = 30
let g:neovide_padding_right = 30
let g:neovide_padding_bottom = 30
let g:neovide_cursor_vfx_mode = "railgun"
