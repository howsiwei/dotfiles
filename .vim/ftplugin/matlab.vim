setl commentstring=%%s
setl keywordprg=info\ octave\ --vi-keys\ --index-search

nn <buffer> <silent> <F9> :up<Bar>:!octave -q --persist %<CR><CR>

