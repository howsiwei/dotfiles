setl commentstring=//%s
setl noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
if !filereadable('Makefile') && !filereadable('makefile')
	if expand('%:p') =~ '.*/cs50/.*'
		let &l:makeprg = 'make LDLIBS="-lcs50 -lm" '.expand('%:t:r')
	else
		let &l:makeprg = 'make '.expand('%:t:r')
	endif
endif

let g:syntastic_c_compiler_options = $CFLAGS.' '.$CWNOUNUSEDFLAGS
let b:testfile = expand('%:t:r:gs?\d*$??')
let b:testfile_in  = b:testfile.'.in'
let b:testfile_out = b:testfile.'.out'

nn <buffer> <silent> <Leader>i :execute 'e '.b:testfile_in<CR>
nn <buffer> <silent> <F7> :up<Bar>MakeWithShell<CR><CR>
nn <buffer> <silent> <F8> :!./%:r<CR>
nn <buffer> <silent> <F2> :execute '!./%:r < '.b:testfile_in<CR>
ino <buffer> {<CR> {<CR>}<Esc>O

