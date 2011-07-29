" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Raul Acuna <raula@synopsys.com>
" Last Change:	2011 Feb 02
" Based on colorscheme by Jose Eterovic

hi clear
set background=dark

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "raula"
hi Normal		                                                                                                guifg=white         guibg=black
hi Scrollbar	                                                                                                guifg=darkcyan      guibg=cyan
hi Menu			                                                                                                guifg=black         guibg=cyan
hi SpecialKey	  term=bold         cterm=bold          ctermfg=darkred                                         guifg=Blue
hi NonText		  term=bold         cterm=bold          ctermfg=white                          gui=bold         guifg=Blue
hi Directory	  term=bold         cterm=bold          ctermfg=brown	                                        guifg=Blue
hi ErrorMsg		  term=standout     cterm=bold          ctermfg=grey        ctermbg=blue                        guifg=White         guibg=Red
hi Search		  term=reverse	    cterm=reverse       ctermfg=white       ctermbg=red	                        guifg=white         guibg=Red
hi MoreMsg		  term=bold         cterm=bold          ctermfg=darkgreen	                    gui=bold        guifg=SeaGreen
hi ModeMsg		  term=bold         cterm=bold                                                  gui=bold        guifg=White	        guibg=Blue
hi LineNr		  term=underline    cterm=bold          ctermfg=yellow	                                        guifg=Yellow
hi Question		  term=standout     cterm=bold          ctermfg=darkgreen	                    gui=bold        guifg=Green
hi StatusLine	  term=bold,reverse cterm=bold          ctermfg=darkred     ctermbg=white       gui=bold        guifg=blue          guibg=white
hi StatusLineNC   term=reverse	                        ctermfg=white       ctermbg=darkred                     guifg=white         guibg=blue
hi Title		  term=bold         cterm=bold          ctermfg=darkmagenta                     gui=bold	    guifg=Magenta
hi Visual		  term=reverse	    cterm=reverse                                               gui=reverse
hi WarningMsg	  term=standout     cterm=bold          ctermfg=darkred                                         guifg=Red
hi Cursor		                                                                                                guifg=bg	        guibg=Green
hi Comment		  term=NONE         cterm=NONE          ctermfg=yellow                                          guifg=#80a0ff
hi Constant		  term=underline    cterm=bold          ctermfg=darkcyan                                        guifg=#ffa0a0
hi String		  term=underline    cterm=bold          ctermfg=red                                             guifg=#ffa0a0
hi Special		  term=bold         cterm=bold          ctermfg=red                                             guifg=Orange
hi Identifier	  term=underline                        ctermfg=brown                                           guifg=#40ffff
hi Statement	  term=bold         cterm=bold          ctermfg=lightblue                       gui=bold        guifg=#ffff60
hi Operator 	  term=bold         cterm=bold          ctermfg=yellow                          gui=bold        guifg=#ffff60
hi PreProc		  term=underline                        ctermfg=darkgreen	                                    guifg=#ff80ff
hi Type			  term=underline    cterm=bold          ctermfg=red                             gui=bold        guifg=#60ff60
hi Error		  term=reverse	                        ctermfg=yellow      ctermbg=black                       guifg=Red	        guibg=Black
hi Todo			  term=standout                         ctermfg=black	    ctermbg=darkcyan                    guifg=Blue          guibg=Yellow
hi link IncSearch		Visual
hi link Character		Constant
hi link Number			Constant
hi link Boolean			Constant
hi link Float			Number
hi link Function		Identifier
hi link Conditional		Statement
hi link Repeat			Statement
hi link Label			Statement
hi link Operator		Statement
hi link Keyword			Statement
hi link Exception		Statement
hi link Include			PreProc
hi link Define			PreProc
hi link Macro			PreProc
hi link PreCondit		PreProc
hi link StorageClass	Type
hi link Structure		Type
hi link Typedef			Type
hi link Tag				Special
hi link SpecialChar		Special
hi link Delimiter		Special
hi link SpecialComment	Special
hi link Debug			Special
