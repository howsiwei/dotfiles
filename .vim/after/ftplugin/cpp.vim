if exists("loaded_matchit")
  let b:match_ignorecase = 0
  let b:match_words =
    \ '\<if\>:\<else\>,' .
    \ '\<do\>:\<while\>'
endif

