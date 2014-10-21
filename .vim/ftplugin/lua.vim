setl noexpandtab tabstop=3 shiftwidth=3 softtabstop=3

nn <buffer> <silent> <F3> :up<Bar>:!luajit % < %<.in<CR>
nn <buffer> <silent> <F4> :up<Bar>:!rlwrap luajit -i %<CR>
nn <buffer> <silent> <F9> :up<Bar>:!luajit %<CR>
nn <buffer> <silent> <F10> :up<Bar>:!lua %<CR>

