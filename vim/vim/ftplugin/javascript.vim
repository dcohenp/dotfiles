
" Indent python with 4 spaces
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79

" setlocal foldmethod=indent
setlocal foldcolumn=4

setlocal makeprg=jslint\ %
setlocal errorformat=%-P%f,
                    \%-G/*jslint\ %.%#*/,
                    \%*[\ ]%n\ %l\\,%c:\ %m,
                    \%-G\ \ \ \ %.%#,
                    \%-GNo\ errors\ found.,
                    \%-Q
