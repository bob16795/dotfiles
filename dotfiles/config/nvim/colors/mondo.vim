" Vim color file
" Maintainer:   Your name <youremail@something.com>
" Last Change:  
" URL:		

" cool help screens
" :he group-name
" :he highlight-groups
" :he gui-colors

" your pick:
set background=dark	" or light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="mondo"
set termguicolors

hi Normal guifg=#252323 guibg=#FFBB8B

" OR

" highlight clear Normal
" set background&
" highlight clear
" if &background == "light"
"   highlight Error ...
"   ...
" else
"   highlight Error ...
"   ...
" endif

" A good way to see what your colorscheme does is to follow this procedure:
" :w 
" :so % 
"
" Then to see what the current setting is use the highlight command.  
" For example,
" 	:hi Cursor
" gives
"	Cursor         xxx guifg=bg guibg=fg 
 	
" Uncomment and complete the commands you want to change from the default.

"hi Cursor		
"hi CursorIM	
hi Directory guifg=#252323
"hi DiffAdd		
"hi DiffChange	
"hi DiffDelete	
"hi DiffText	
"hi ErrorMsg	
hi VertSplit guibg=#BD9B61 guifg=#9F7A39
hi EndOfBuffer guibg=#FFBB8B guifg=#FFBB8B
"hi Folded		
"hi FoldColumn	
"hi IncSearch	
hi LineNr guibg=#FFBB8B guifg=#252323 gui=bold
hi CursorLineNr guibg=#FFBB8B guifg=#d79921 gui=bold
"hi ModeMsg		
hi MoreMsg guibg=#FFBB8B guifg=#252323 gui=reverse
hi NonText guifg=#076678		
hi Question guibg=#FFBB8B guifg=#252323
hi Search guibg=#FF8C57 guifg=#ffffff
hi SpecialKey	guifg=#076678
hi StatusLine guibg=#FF8C57 guifg=#ffffff	gui=bold
hi SignColumn guibg=#BD9B61 guifg=#9F7A39 gui=none
hi LineNr guibg=#BD9B61 guifg=#9F7A39 gui=none
hi StatusLineNC	guibg=#FF8C57 guifg=#ffffff gui=bold
hi User1 guibg=#FF8C57 guifg=#ffffff
"hi Title		
"hi Visual		
"hi VisualNOS	
"hi WarningMsg	
"hi WildMenu	
"hi Menu		
"hi Scrollbar	
"hi Tooltip		

" syntax highlighting groups
hi Comment gui=italic guifg=#98971a
hi Constant guifg=#d79921
hi Identifier guifg=#b16286 gui=bold
hi Statement guifg=#252323
hi PreProc guifg=#458588
hi Type	guifg=#689d6a
hi Special guifg=#076678
hi Underlined	guifg=#458588 gui=underline
"hi Ignore		
"hi Error		
"hi Todo		

hi SyntasticErrorLine guibg=#cc241d
hi SyntasticErrorSign guibg=#FFBB8B guifg=#cc241d
hi SyntasticWarningLine guibg=#d79921
hi SyntasticWarningSign guibg=#FFBB8B guifg=#d79921
hi String guifg=#98971a

hi TabLine guibg=#BD9B61 guifg=#9F7A39

hi BufferCurrent guibg=#FF8C57 guifg=#ffffff
hi BufferCurrentMod guibg=#FF8C57 guifg=#ffffff
hi BufferCurrentSign guibg=#FF8C57 guifg=#F77438
hi BufferCurrentSignRight guibg=#FF8C57 guifg=#9F7A39

hi BufferVisible guibg=#BD9B61 guifg=#9F7A39
hi BufferVisibleMod guibg=#BD9B61 guifg=#9F7A39
hi BufferVisibleSign guibg=#BD9B61 guifg=#9F7A39
hi BufferVisibleSignRight guibg=#BD9B61 guifg=#9F7A39

hi BufferInactive guibg=#BD9B61 guifg=#9F7A39
hi BufferInactiveMod guibg=#BD9B61 guifg=#9F7A39
hi BufferInactiveSign guibg=#BD9B61 guifg=#9F7A39
hi BufferInactiveSignRight guibg=#BD9B61 guifg=#9F7A39

hi BufferTabpageFill guibg=#BD9B61 guifg=#9F7A39
hi BufferOffset guibg=#FFBB8B guifg=#252323

hi Pmenu guibg=#BD9B61 guifg=#9F7A39
hi PmenuSel guibg=#FF8C57 guifg=#ffffff
