" Vim syntax file
" Language: C++ Additions
" Maintainer: Jon Haggblad <jon@haeggblad.com>
" URL: http://www.haeggblad.com
" Last Change: 6 Sep 2014
" Version: 0.4
" Changelog:
"   0.1 - initial version.
"   0.2 - C++14
"   0.3 - Incorporate lastest changes from Mizuchi/STL-Syntax
"   0.4 - Add template function highlight
"
" Additional Vim syntax highlighting for C++ (including C++11)
"
" This file contains additional syntax highlighting that I use for my C++11/14
" development in Vim. Compared to the standard syntax highlighting for C++ it
" adds highlighting of (user defined) functions and the containers and types
" in the standard library / boost.
"
" Based on:
"   http://stackoverflow.com/questions/736701/class-function-names-highlighting-in-vim
"   http://www.vim.org/scripts/script.php?script_id=4293
"   http://www.vim.org/scripts/script.php?script_id=2224
"   http://www.vim.org/scripts/script.php?script_id=1640
"   http://www.vim.org/scripts/script.php?script_id=3064

" -----------------------------------------------------------------------------
"  Highlight Class and Function names.
"
" Based on the discussion in:
"   http://stackoverflow.com/questions/736701/class-function-names-highlighting-in-vim
" -----------------------------------------------------------------------------

" Functions
syn match    cCustomParen    "(" contains=cParen contains=cCppParen
syn match    cCustomFunc     "\w\+\s*(\@=" contains=cCustomParen

" Template functions
syn region   cCustomAngleBrackets transparent matchgroup=cCppParen start='[[:space:]<]\@<!<<\@!' end='>' contains=ALLBUT,@cParenGroup,cCppParen,cCppString,@Spell
syn match    cCustomBrack    "<" contains=cCustomAngleBrackets
syn match    cCustomTemplateFunc     "\w\+\s*<.*>(\@=" contains=cCustomBrack

" Class and namespace scope
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

hi def link cCustomFunc  Function
if exists('g:cpp_experimental_template_highlight') && g:cpp_experimental_template_highlight
    hi def link cCustomTemplateFunc  Function
endif
hi def link cCustomClass Type

" Alternative syntax that is used in:
"  http://www.vim.org/scripts/script.php?script_id=3064
"syn match cUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=cType,cDelimiter,cDefine
"hi def link cCustomFunc  Function
