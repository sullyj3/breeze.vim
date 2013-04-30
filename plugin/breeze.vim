" ============================================================================
" File: plugin/breeze.vim
" Description: DOM navigation
" Mantainer: Giacomo Comitti (https://github.com/gcmt)
" Url: https://github.com/gcmt/breeze.vim
" License: MIT
" Version: 1.0
" Last Changed: 30/04/2013
" ============================================================================

" Init

if exists("g:breeze_loaded") || &cp || exists("g:breeze_disable") || 
    \ !has('python')
    finish
endif
let g:breeze_loaded = 1


" Settings

let g:breeze_highlight_tag = 
    \ get(g:, 'breeze_highlight_tag', 1)

" colors 

hi BreezeDefaultShade gui=NONE guifg=#777777 cterm=NONE ctermfg=242
hi BreezeDefaultJumpMark gui=bold guifg=#ff6155 cterm=bold ctermfg=203

let g:breeze_tag_color = 
    \ get(g:, 'breeze_tag_color', 'MatchParen')
let g:breeze_tag_color_darkbg = 
    \ get(g:, 'breeze_tag_color_darkbg', 'MatchParen')

let g:breeze_shade_color = 
    \ get(g:, 'breeze_shade_color', 'BreezeDefaultShade')
let g:breeze_shade_color_darkbg = 
    \ get(g:, 'breeze_shade_color_darkbg', 'BreezeDefaultShade')

let g:breeze_jumpmark_color = 
    \get(g:, 'breeze_jumpmark_color', 'BreezeDefaultJumpMark')
let g:breeze_jumpmark_color_darkbg = 
    \ get(g:, 'breeze_jumpmark_color_darkbg', 'BreezeDefaultJumpMark')

let g:breeze_tagblock_color = 
    \ get(g:, 'breeze_tagblock_color', 'MatchParen')
let g:breeze_tagblock_color_darkbg = 
    \ get(g:, 'breeze_tagblock_color_darkbg', 'MatchParen')


" Commands

command! BreezeJumpForward call breeze#JumpForward()
command! BreezeJumpBackward call breeze#JumpBackward()

command! BreezeCurrentTag call breeze#CurrentTag()
command! BreezeHighlightTag call breeze#HighlightTag()
command! BreezeHighlightTagBlock call breeze#HighlightTagBlock()

command! BreezeNextSibling call breeze#NextSibling()
command! BreezePrevSibling call breeze#PrevSibling()
command! BreezeFirstChild call breeze#FirstChild()
command! BreezeLastChild call breeze#LastChild()
command! BreezeParent call breeze#Parent()

command! BreezePrintDom call breeze#PrintDom()


" autocommands

augroup breeze_init
    au!
    au BufWinEnter *.html,*.htm,*.xhtml,*.xml if !exists("g:breeze_initialized") | 
                \ call breeze#init() | endif
augroup END
