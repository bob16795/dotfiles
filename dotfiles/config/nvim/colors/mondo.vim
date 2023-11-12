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

hi Normal guifg=#D8DEE9 guibg=#2E3440

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
hi Directory guifg=#D8DEE9
"hi DiffAdd		
"hi DiffChange	
"hi DiffDelete	
"hi DiffText	
"hi ErrorMsg	
hi VertSplit guibg=#434C5E guifg=#4C566A
hi EndOfBuffer guibg=#2E3440 guifg=#2E3440
"hi Folded		
"hi FoldColumn	
"hi IncSearch	
hi LineNr guibg=#2E3440 guifg=#D8DEE9 gui=bold
hi CursorLineNr guibg=#2E3440 guifg=#EBCB8B gui=bold
"hi ModeMsg		
hi MoreMsg guibg=#2E3440 guifg=#D8DEE9 gui=reverse
hi NonText guifg=#B48EAD		
hi Question guibg=#2E3440 guifg=#D8DEE9
hi Search guibg=#3B4252 guifg=#f9f5d7
hi SpecialKey	guifg=#B48EAD
hi StatusLine guibg=#3B4252 guifg=#f9f5d7	gui=bold
hi SignColumn guibg=#434C5E guifg=#D8DEE9 gui=none
hi LineNr guibg=#434C5E guifg=#D8DEE9 gui=none
hi StatusLineNC	guibg=#3B4252 guifg=#f9f5d7 gui=bold
hi User1 guibg=#3B4252 guifg=#f9f5d7
"hi Title		
"hi Visual		
"hi VisualNOS	
"hi WarningMsg	
"hi WildMenu	
"hi Menu		
"hi Scrollbar	
"hi Tooltip		

" syntax highlighting groups
hi Comment gui=italic guifg=#A3BE8C
hi Constant guifg=#EBCB8B
hi Identifier guifg=#D08770 gui=bold
hi Statement guifg=#D8DEE9
hi PreProc guifg=#5E81AC
hi Type	guifg=#88C0D0
hi Special guifg=#B48EAD
hi Underlined	guifg=#5E81AC gui=underline
"hi Ignore		
"hi Error		
"hi Todo		

hi SyntasticErrorLine guibg=#BF616A
hi SyntasticErrorSign guibg=#2E3440 guifg=#BF616A
hi SyntasticWarningLine guibg=#EBCB8B
hi SyntasticWarningSign guibg=#2E3440 guifg=#EBCB8B
hi String guifg=#A3BE8C

hi TabLine guibg=#434C5E guifg=#4C566A

hi BufferCurrent guibg=#3B4252 guifg=#f9f5d7
hi BufferCurrentMod guibg=#3B4252 guifg=#f9f5d7
hi BufferCurrentSign guibg=#3B4252 guifg=#4C566A
hi BufferCurrentSignRight guibg=#3B4252 guifg=#4C566A

hi BufferVisible guibg=#434C5E guifg=#D8DEE9
hi BufferVisibleMod guibg=#434C5E guifg=#D8DEE9
hi BufferVisibleSign guibg=#434C5E guifg=#4C566A
hi BufferVisibleSignRight guibg=#434C5E guifg=#4C566A

hi BufferInactive guibg=#434C5E guifg=#D8DEE9
hi BufferInactiveMod guibg=#434C5E guifg=#D8DEE9
hi BufferInactiveSign guibg=#434C5E guifg=#4C566A
hi BufferInactiveSignRight guibg=#434C5E guifg=#4C566A

hi BufferTabpageFill guibg=#434C5E guifg=#D8DEE9
hi BufferOffset guibg=#2E3440 guifg=#D8DEE9

hi Pmenu guibg=#434C5E guifg=#D8DEE9
hi PmenuSel guibg=#3B4252 guifg=#f9f5d7
