" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:   Wladimir Plagges <wladimir@synopsys.com>
" Last Change:   2008 Jan 17

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "wladimir"
hi Normal     ctermbg=DarkGrey ctermfg=Green                    guibg=grey20  guifg=White
"hi Normal    ctermbg=Black    ctermfg=LightGreen               guibg=Black   guifg=lightgreen
hi Comment    term=underline   ctermfg=Yellow                   guifg=#80a0ff
hi Constant   term=underline   ctermfg=Cyan                     guifg=Magenta
hi Special    term=bold        ctermfg=DarkMagenta              guifg=Red
hi Identifier term=underline   ctermfg=Cyan        cterm=bold   guifg=#40ffff 
hi Statement  term=bold        ctermfg=White                    guifg=#aa4444 gui=bold
hi PreProc    term=underline   ctermfg=Red                      guifg=#ff80ff
hi Type       term=underline   ctermfg=White                    guifg=#60ff60 gui=bold
hi Function   term=bold        ctermfg=White                    guifg=White
hi Repeat     term=bold        ctermfg=White                    guifg=white
hi Operator                    ctermfg=Red                      guifg=Red
hi Ignore                      ctermfg=black                    guifg=bg
hi Error      term=reverse     ctermfg=White       ctermbg=Red  guifg=White   guibg=Red
hi Todo       term=standout    ctermfg=Black       ctermbg=Grey guifg=Blue    guibg=Yellow
hi LineNr     term=underline   ctermfg=Brown                    guifg=Yellow
"hi Search     term=reverse     ctermfg=white       ctermbg=red  guifg=white   guibg=Red
hi Search     term=reverse     ctermfg=Yellow  cterm=underline     ctermbg=Blue  guifg=white   guibg=Red

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String   Constant
hi link Character   Constant
hi link Number   Constant
hi link Boolean   Constant
hi link Float      Number
hi link Conditional   Repeat
hi link Label      Repeat
hi link Keyword   Statement
hi link Exception   Statement
hi link Include   PreProc
hi link Define   PreProc
hi link Macro      PreProc
hi link PreCondit   PreProc
hi link StorageClass   Type
hi link Structure   Type
hi link Typedef   Type
hi link Tag      Special
hi link SpecialChar   Special
hi link Delimiter   Special
hi link SpecialComment Special
hi link Debug      Special

hi clear CursorColumn
hi link  CursorColumn   CursorLine
" do not make help bars and stars invisible
hi clear helpBar
hi link  helpBar        helpHyperTextJump
hi clear helpStar
hi link  helpStar       helpHyperTextEntry

highlight DiffAdd cterm=none ctermfg=Magenta ctermbg=bg gui=none guifg=Magenta guibg=bg
highlight DiffDelete cterm=none ctermfg=bg ctermbg=bg gui=none guifg=bg guibg=bg
highlight DiffChange cterm=none ctermfg=fg ctermbg=bg gui=none guifg=fg guibg=bg
highlight DiffText cterm=none ctermfg=Magenta ctermbg=bg gui=none guifg=Magenta guibg=bg
