" Set this to 1 to use ultisnips for snippet handling
let s:using_snippets = 1
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'preservim/nerdtree'
    Plug 'jiangmiao/auto-pairs'
    Plug 'Shougo/neocomplcache.vim'
    Plug 'zah/nim.vim'
    Plug 'scrooloose/syntastic'
    Plug 'farmergreg/vim-lastplace'
    Plug 'airblade/vim-gitgutter'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'voldikss/vim-floaterm'
    Plug 'vimwiki/vimwiki'
    Plug 'bob16795/markup.vim'
    Plug 'vim-scripts/LargeFile'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }    
    Plug 'dradtke/VIP'
    Plug 'Shougo/neocomplcache'
    Plug 'noahfrederick/vim-noctu'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'ojroques/vim-scrollstatus'
    Plug 'idbrii/vim-unityengine'
    Plug 'OmniSharp/omnisharp-vim'  
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nanotee/zoxide.vim'

call plug#end()

syntax enable
syntax on
set nocompatible


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
set t_Co=256
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

" nim ctags
au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'nim',
    \ 'whitelist': ['nim'],
    \ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}
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

map <F5> :!dotnet run<Return>
set spell
hi SpellBad cterm=bold ctermfg=red ctermbg=none
hi SpellCap cterm=bold ctermfg=blue ctermbg=none
hi VertSplit cterm=none
hi CursorLine cterm=none
hi EndOfBuffer ctermfg=black
let g:minimap_width = 20 
let g:minimap_auto_start = 1 
let g:minimap_git_colors = 1 
let g:deoplete#enable_at_startup = 1

autocmd FileType markup set makeprg=markup_comp\ %

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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
nnoremap <leader>n :NERDTreeToggle<CR>
map <f9> :make<cr>
map <f8> :make clean<cr>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

if filereadable(expand('project.vim'))
  exe 'source project.vim'
endif

