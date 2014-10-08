" Vim syntax file
" Language:	Scheme (R5RS + some R6RS extras)
" Last Change:	2012 May 13
" Maintainer:	Sergey Khorev <sergey.khorev@gmail.com>
" Original author:	Dirk van Deun <dirk@igwe.vub.ac.be>

" This script incorrectly recognizes some junk input as numerals:
" parsing the complete system of Scheme numerals using the pattern
" language is practically impossible: I did a lax approximation.

" MzScheme extensions can be activated with setting is_mzscheme variable

" Suggestions and bug reports are solicited by the author.

" Initializing:

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

" Fascist highlighting: everything that doesn't fit the rules is an error...

syn match	schemeError	![^ \t()\[\]";]*!
syn match	schemeError	")"

syn region schemeStrucRestricted matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeStrucRestricted matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

" Popular Scheme extension:
" using [] as well as ()
syn region schemeStrucRestricted matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeStrucRestricted matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeUnquote matchgroup=Delimiter start="," end=![ \t\[\]()";]!me=e-1 contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeUnquote matchgroup=Delimiter start=",@" end=![ \t\[\]()";]!me=e-1 contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeUnquote matchgroup=Delimiter start=",(" end=")" contains=ALL
syn region schemeUnquote matchgroup=Delimiter start=",@(" end=")" contains=ALL

syn region schemeUnquote matchgroup=Delimiter start=",#(" end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeUnquote matchgroup=Delimiter start=",@#(" end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeUnquote matchgroup=Delimiter start=",\[" end="\]" contains=ALL
syn region schemeUnquote matchgroup=Delimiter start=",@\[" end="\]" contains=ALL

syn region schemeUnquote matchgroup=Delimiter start=",#\[" end="\]" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeUnquote matchgroup=Delimiter start=",@#\[" end="\]" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

" R5RS Scheme Functions and Syntax:

if version < 600
  set iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
else
  setlocal iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
endif

syn keyword schemeSpecial  <=
syn keyword schemeSyntax   true does
syn keyword schemeSyntax   role base input init
syn keyword schemeSyntax   legal goal terminal
syn keyword schemeSyntax   next

" syn keyword schemeFunc or

" ... so that a single + or -, inside a quoted context, would not be
" interpreted as a number (outside such contexts, it's a schemeFunc)

syn match	schemeDelimiter	!\.[ \t\[\]()";]!me=e-1
syn match	schemeDelimiter	!\.$!
" ... and a single dot is not a number but a delimiter

" This keeps all other stuff unhighlighted, except *stuff* and <stuff>:

syn match	schemeOther	,[a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*,
syn match	schemeError	,[a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

syn match	schemeOther	"\.\.\."
syn match	schemeError	!\.\.\.[^ \t\[\]()";]\+!
" ... a special identifier

syn match	schemeConstant	,\*[-a-z!$%&*/:<=>?^_~0-9+.@]\+\*[ \t\[\]()";],me=e-1
syn match	schemeConstant	,\*[-a-z!$%&*/:<=>?^_~0-9+.@]\+\*$,
syn match	schemeError	,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

syn match	schemeConstant	,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[ \t\[\]()";],me=e-1
syn match	schemeConstant	,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>$,
syn match	schemeError	,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

" Non-quoted lists, and strings:

syn region schemeStruc matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALL
syn region schemeStruc matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALL

syn region schemeStruc matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALL
syn region schemeStruc matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALL

" Simple literals:
syn region schemeString start=+\%(\\\)\@<!"+ skip=+\\[\\"]+ end=+"+ contains=@Spell

" Comments:

syn match	schemeComment	";.*$" contains=@Spell


" Writing out the complete description of Scheme numerals without
" using variables is a day's work for a trained secretary...

syn match	schemeOther	![+-][ \t\[\]()";]!me=e-1
syn match	schemeOther	![+-]$!
"
" This is a useful lax approximation:
syn match	schemeNumber	"[-#+.]\=[0-9][-#+/0-9a-f@i.boxesfdl]*"
syn match	schemeError	![-#+0-9.][-#+/0-9a-f@i.boxesfdl]*[^-#+/0-9a-f@i.boxesfdl \t\[\]()";][^ \t\[\]()";]*!

syn match	schemeBoolean	"#[tf]"
syn match	schemeError	!#[tf][^ \t\[\]()";]\+!

syn match	schemeCharacter	"#\\"
syn match	schemeCharacter	"#\\."
syn match       schemeError	!#\\.[^ \t\[\]()";]\+!
syn match	schemeCharacter	"#\\space"
syn match	schemeError	!#\\space[^ \t\[\]()";]\+!
syn match	schemeCharacter	"#\\newline"
syn match	schemeError	!#\\newline[^ \t\[\]()";]\+!

" R6RS
syn match schemeCharacter "#\\x[0-9a-fA-F]\+"


" Synchronization and the wrapping up...

syn sync match matchPlace grouphere NONE "^[^ \t]"
" ... i.e. synchronize on a line that starts at the left margin

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_scheme_syntax_inits")
  if version < 508
    let did_scheme_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink schemeSpecial	Constant
  HiLink schemeSyntax		Statement
  HiLink schemeFunc		Function

  HiLink schemeString		String
  HiLink schemeCharacter	Character
  HiLink schemeNumber		Number
  HiLink schemeBoolean		Boolean

  HiLink schemeDelimiter	Delimiter
  HiLink schemeConstant		Constant

  HiLink schemeComment		Comment
  HiLink schemeMultilineComment	Comment
  HiLink schemeError		Error

  HiLink schemeExtSyntax	Type
  HiLink schemeExtFunc		PreProc
  delcommand HiLink
endif

let b:current_syntax = "kif"

let &cpo = s:cpo_save
unlet s:cpo_save
