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

hi Normal guifg=#ffffff guibg=#1b1b1b

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
hi Directory guifg=#ffffff
"hi DiffAdd		
"hi DiffChange	
"hi DiffDelete	
"hi DiffText	
"hi ErrorMsg	
hi VertSplit guibg=#9A1C3E guifg=#9A1C3E
hi EndOfBuffer guibg=#1b1b1b guifg=#1b1b1b
"hi Folded		
"hi FoldColumn	
"hi IncSearch	
hi LineNr guibg=#1b1b1b guifg=#ffffff gui=bold
hi CursorLineNr guibg=#1b1b1b guifg=#B0EAD9 gui=bold
"hi ModeMsg		
hi MoreMsg guibg=#1b1b1b guifg=#ffffff gui=reverse
hi NonText guifg=#8292B2		
hi Question guibg=#1b1b1b guifg=#ffffff
hi Search guibg=#E54F5D guifg=#FFFFFF
hi SpecialKey	guifg=#8292B2
hi StatusLine guibg=#E54F5D guifg=#FFFFFF	gui=bold
hi SignColumn guibg=#9A1C3E guifg=#ffffff gui=none
hi LineNr guibg=#9A1C3E guifg=#ffffff gui=none
hi StatusLineNC	guibg=#E54F5D guifg=#FFFFFF gui=bold
hi User1 guibg=#E54F5D guifg=#FFFFFF
"hi Title		
"hi Visual		
"hi VisualNOS	
"hi WarningMsg	
"hi WildMenu	
"hi Menu		
"hi Scrollbar	
"hi Tooltip		

" syntax highlighting groups
hi Comment gui=italic guifg=#3EA290
hi Constant guifg=#B0EAD9
hi Identifier guifg=#596196 gui=bold
hi Statement guifg=#ffffff
hi PreProc guifg=#31658C
hi Type	guifg=#95A7CC
hi Special guifg=#8292B2
hi Underlined	guifg=#31658C gui=underline
"hi Ignore		
"hi Error		
"hi Todo		

hi SyntasticErrorLine guibg=#899AFF
hi SyntasticErrorSign guibg=#1b1b1b guifg=#899AFF
hi SyntasticWarningLine guibg=#B0EAD9
hi SyntasticWarningSign guibg=#1b1b1b guifg=#B0EAD9
hi String guifg=#3EA290

hi TabLine guibg=#9A1C3E guifg=#9A1C3E

hi BufferCurrent guibg=#E54F5D guifg=#FFFFFF
hi BufferCurrentMod guibg=#E54F5D guifg=#FFFFFF
hi BufferCurrentSign guibg=#E54F5D guifg=#E54F5D
hi BufferCurrentSignRight guibg=#E54F5D guifg=#9A1C3E

hi BufferVisible guibg=#9A1C3E guifg=#ffffff
hi BufferVisibleMod guibg=#9A1C3E guifg=#ffffff
hi BufferVisibleSign guibg=#9A1C3E guifg=#9A1C3E
hi BufferVisibleSignRight guibg=#9A1C3E guifg=#9A1C3E

hi BufferInactive guibg=#9A1C3E guifg=#ffffff
hi BufferInactiveMod guibg=#9A1C3E guifg=#ffffff
hi BufferInactiveSign guibg=#9A1C3E guifg=#9A1C3E
hi BufferInactiveSignRight guibg=#9A1C3E guifg=#9A1C3E

hi BufferTabpageFill guibg=#9A1C3E guifg=#ffffff
hi BufferOffset guibg=#1b1b1b guifg=#ffffff

hi Pmenu guibg=#9A1C3E guifg=#ffffff
hi PmenuSel guibg=#E54F5D guifg=#FFFFFF
