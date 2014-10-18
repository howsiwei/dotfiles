setl commentstring=%%s
setl keywordprg=info\ octave\ --vi-keys\ --index-search

nn <buffer> <silent> <F7> :up<Bar>:!octave -q --persist %<CR><CR>

