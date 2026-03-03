" Fix: allow link concealing inside bold/italic regions.
" Upstream plasticboy/vim-markdown only has contains=@Spell for these regions,
" which prevents mkdLink/mkdInlineURL from matching inside bold/italic text.

let s:concealends = has('conceal') && get(g:, 'vim_markdown_conceal', 1) ? ' concealends' : ''
let s:oneline = get(g:, 'vim_markdown_emphasis_multiline', 1) ? '' : ' oneline'

execute 'syntax region htmlItalic matchgroup=mkdItalic start="\%(^\|\s\)\zs\*\ze[^\\\*\t ]\%(\%([^*]\|\\\*\|\n\)*[^\\\*\t ]\)\?\*\_W" end="[^\\\*\t ]\zs\*\ze\_W" keepend contains=mkdLink,mkdInlineURL,@Spell' . s:oneline . s:concealends
execute 'syntax region htmlItalic matchgroup=mkdItalic start="\%(^\|\s\)\zs_\ze[^\\_\t ]" end="[^\\_\t ]\zs_\ze\_W" keepend contains=mkdLink,mkdInlineURL,@Spell' . s:oneline . s:concealends
execute 'syntax region htmlBold matchgroup=mkdBold start="\%(^\|\s\)\zs\*\*\ze\S" end="\S\zs\*\*" keepend contains=mkdLink,mkdInlineURL,@Spell' . s:oneline . s:concealends
execute 'syntax region htmlBold matchgroup=mkdBold start="\%(^\|\s\)\zs__\ze\S" end="\S\zs__" keepend contains=mkdLink,mkdInlineURL,@Spell' . s:oneline . s:concealends
execute 'syntax region htmlBoldItalic matchgroup=mkdBoldItalic start="\%(^\|\s\)\zs\*\*\*\ze\S" end="\S\zs\*\*\*" keepend contains=mkdLink,mkdInlineURL,@Spell' . s:oneline . s:concealends
execute 'syntax region htmlBoldItalic matchgroup=mkdBoldItalic start="\%(^\|\s\)\zs___\ze\S" end="\S\zs___" keepend contains=mkdLink,mkdInlineURL,@Spell' . s:oneline . s:concealends

" Custom [[note]] paragraph syntax for shelf articles.
" [[note]] tag is yellow bold; the rest of the paragraph is Comment-styled.
syntax region shelfNote matchgroup=shelfNoteTag start="\[\[note\]\]" end="\n\n\|\n\%$\|%$" containedin=ALL
highlight! link shelfNote Comment
highlight! shelfNoteTag guifg=#b58900 gui=bold ctermfg=3 cterm=bold
