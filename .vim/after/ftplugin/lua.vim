if exists("loaded_matchit")
  let b:match_ignorecase = 0
  let b:match_words =
    \ '\<\%(\(^\s*\)\@<=do\>\|while\|for\|function\|if\)\>:' .
    \ '\<\%(else\|elseif\)\>:' .
    \ '\<end\>,' .
    \ '\<repeat\>:\<until\>'
endif

