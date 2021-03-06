" Vim color scheme
" Name:         special-vividchalk.vim
" Author:       Kirill Jakovlev <special-k@li.ru>

" Based on the vividchalk theme by Tim Pope
" Distributable under the same terms as Vim itself (see :help license)

if has("gui_running")
    set background=dark
endif
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "special-vividchalk"

" First two functions adapted from inkpot.vim

" map a urxvt cube number to an xterm-256 cube number
fun! s:M(a)
    return strpart("0245", a:a, 1) + 0
endfun

" map a urxvt colour to an xterm-256 colour
fun! s:X(a)
    if &t_Co == 88
        return a:a
    else
        if a:a == 8
            return 237
        elseif a:a < 16
            return a:a
        elseif a:a > 79
            return 232 + (3 * (a:a - 80))
        else
            let l:b = a:a - 16
            let l:x = l:b % 4
            let l:y = (l:b / 4) % 4
            let l:z = (l:b / 16)
            return 16 + s:M(l:x) + (6 * s:M(l:y)) + (36 * s:M(l:z))
        endif
    endif
endfun

function! E2T(a)
    return s:X(a:a)
endfunction

function! s:choose(mediocre,good)
    if &t_Co != 88 && &t_Co != 256
        return a:mediocre
    else
        return s:X(a:good)
    endif
endfunction

function! s:hifg(group,guifg,first,second,...)
    if a:0 && &t_Co == 256
        let ctermfg = a:1
    else
        let ctermfg = s:choose(a:first,a:second)
    endif
    exe "highlight ".a:group." guifg=".a:guifg." ctermfg=".ctermfg
endfunction

function! s:hibg(group,guibg,first,second)
    let ctermbg = s:choose(a:first,a:second)
    exe "highlight ".a:group." guibg=".a:guibg." ctermbg=".ctermbg
endfunction

"Rails
"----------------------------------------
hi link railsMethod         PreProc

"Ruby
"----------------------------------------
hi link rubyDefine          Keyword
hi link rubySymbol          Constant
hi link rubyAccess          rubyMethod
hi link rubyAttribute       rubyMethod
hi link rubyEval            rubyMethod
hi link rubyException       rubyMethod
hi link rubyInclude         rubyMethod
hi link rubyStringDelimiter rubyString
hi link rubyRegexp          Regexp
hi link rubyRegexpDelimiter rubyRegexp
"hi link rubyConstant        Variable
"hi link rubyGlobalVariable  Variable
"hi link rubyClassVariable   Variable
"hi link rubyInstanceVariable Variable

"JavaScript
"----------------------------------------
hi link javaScript              Normal
"hi link javaScriptBraces        Normal
hi link javascriptRegexpString  Regexp
hi link javascriptNumber        Number
hi link javascriptNull          Constant

"Diff
"----------------------------------------
highlight link diffAdded        String
highlight link diffRemoved      Statement
highlight link diffLine         PreProc
highlight link diffSubname      Comment

"Html
"----------------------------------------
hi htmlTag guifg=#ffffaa
hi htmlBold gui=bold
hi htmlEndTag guifg=#ffffaa
hi htmlTitle gui=bold guifg=#ffffaa
hi htmlLink guifg=#0077ff
highlight link htmlH1           htmlTitle

"Common
"----------------------------------------
call s:hifg("Normal","#EEEEEE","White",87)
if &background == "light" || has("gui_running")
    hi Normal guibg=#000911 ctermbg=Black guifg=#aaffff
else
    hi Normal guibg=Black ctermbg=NONE
endif
highlight StatusLine    guifg=#000911   guibg=#ffffff gui=bold ctermfg=Black ctermbg=White  cterm=bold
highlight StatusLineNC  guifg=Black guibg=Gray26 gui=none ctermfg=Black ctermbg=Grey   cterm=none

"if &t_Co == 256
    "highlight StatusLine ctermbg=117
"else
    "highlight StatusLine ctermbg=43
"endif

highlight Ignore        ctermfg=Black
highlight WildMenu      guifg=Black   guibg=#ffff00 gui=bold ctermfg=Black ctermbg=Yellow cterm=bold
highlight Cursor        guifg=Black guibg=White ctermfg=Black ctermbg=White
highlight CursorLine    guibg=#333333 guifg=NONE
highlight CursorColumn  guibg=#333333 guifg=NONE
highlight NonText       guifg=#003366 ctermfg=8
highlight SpecialKey    guifg=#003366 ctermfg=8
highlight Directory     none
high link Directory     Identifier
highlight ErrorMsg      guibg=#ff6666 ctermbg=DarkRed guifg=Black ctermfg=NONE
highlight Search        guifg=NONE ctermfg=NONE gui=none cterm=none
call s:hibg("Search"    ,"#004499","DarkBlue",81)
highlight IncSearch     guifg=White guibg=Black ctermfg=White ctermbg=Black
highlight MoreMsg       guifg=#00ddff ctermfg=Green
highlight LineNr        guifg=#DDEEFF ctermfg=White
call s:hibg("LineNr"    ,"#222222","DarkBlue",80)
highlight Question      none
high link Question      MoreMsg
highlight Title         guifg=Magenta ctermfg=Magenta
highlight VisualNOS     gui=none cterm=none
call s:hibg("Visual"    ,"#aaffff","LightBlue",83)
hi Visual guifg=Black
call s:hibg("VisualNOS" ,"#444444","DarkBlue",81)
call s:hibg("MatchParen","#0000aa","DarkBlue",18)
highlight WarningMsg    guifg=#ff6666 ctermfg=Red
highlight Error         ctermbg=DarkRed guibg=#ff6666
highlight SpellBad      ctermbg=DarkRed
highlight vimTodo       guifg=#000911 guibg=#eeee00 gui=bold
" FIXME: Comments
highlight SpellRare     ctermbg=DarkMagenta
highlight SpellCap      ctermbg=DarkBlue
highlight SpellLocal    ctermbg=DarkCyan
hi VertSplit    gui=BOLD guifg=Black guibg=Gray26

call s:hibg("Folded"    ,"#110077","DarkBlue",17)
call s:hifg("Folded"    ,"#aaddee","LightCyan",63)
highlight FoldColumn    none
high link FoldColumn    Folded
highlight DiffAdd       ctermbg=4 guibg=DarkBlue
highlight DiffChange    ctermbg=5 guibg=DarkMagenta
highlight DiffDelete    ctermfg=12 ctermbg=6 gui=bold guifg=Blue guibg=DarkCyan
highlight DiffText      ctermbg=DarkRed
highlight DiffText      cterm=bold ctermbg=9 gui=bold guibg=#ff6666

highlight Pmenu         guifg=NONE ctermfg=White cterm=bold
highlight PmenuSel      guifg=#222222 ctermfg=White gui=bold cterm=bold
call s:hibg("Pmenu"     ,"#003366","Blue",18)
call s:hibg("PmenuSel"  ,"#ddff00","DarkCyan",39)
highlight PmenuSbar     guibg=#003366 ctermbg=Grey
highlight PmenuThumb    guifg=#aaffff guibg=White ctermbg=White
highlight TabLine       gui=underline cterm=underline
call s:hifg("TabLine"   ,"#bbbbbb","LightGrey",85)
call s:hibg("TabLine"   ,"#333333","DarkGrey",80)
highlight TabLineSel    guifg=White guibg=Black ctermfg=White ctermbg=Black
highlight TabLineFill   gui=underline cterm=underline
call s:hifg("TabLineFill","#bbbbbb","LightGrey",85)
call s:hibg("TabLineFill","#808080","Grey",83)

hi Type gui=none
hi Statement gui=none
if !has("gui_mac")
    " Mac GUI degrades italics to ugly underlining.
    hi Comment gui=italic
    hi railsUserClass  gui=italic
    hi railsUserMethod gui=italic
endif
hi Identifier cterm=none
" Commented numbers at the end are *old* 256 color values
"highlight PreProc       guifg=#EDF8F9
call s:hifg("Comment"        ,"#6666bb","DarkMagenta",34) " 92*
" 26 instead?
call s:hifg("Constant"       ,"#bbff66","DarkCyan",21) " 30*
call s:hifg("rubyNumber"     ,"#CCFF33","Yellow",60) " 190*
call s:hifg("String"         ,"#00bb66","LightGreen",44,82) " 82*
call s:hifg("Identifier"     ,"#eeee00","Yellow",72) " 220*
call s:hifg("Statement"      ,"#00ddff","Brown",68) " 202*
highlight Statement gui=bold
call s:hifg("PreProc"        ,"#ffffaa","LightCyan",48) " 213*
call s:hifg("railsUserMethod","#AACCFF","LightCyan",27)
call s:hifg("Type"           ,"White","Grey",57) " 101*
highlight Type gui=bold
call s:hifg("railsUserClass" ,"#AAAAAA","Grey",7) " 101
call s:hifg("Special"        ,"#FF6666","DarkGreen",24) " 7
call s:hifg("Regexp"         ,"#44B4CC","DarkCyan",21) " 74
call s:hifg("rubyMethod"     ,"#00ddff","Yellow",77) " 191*
"highlight railsMethod   guifg=#EE1122 ctermfg=1
