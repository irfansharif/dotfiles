set nocompatible                          " Make Vim more useful

" Plugins {{{
  " Use vim-plug to manage dependencies, stored to ~/.config/nvim/plugged
  call plug#begin('~/.config/nvim/plugged')
    Plug 'Konfekt/FastFold'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'google/vim-searchindex'
    Plug 'irfansharif/vim-crlfmt'
    Plug 'vim-syntastic/syntastic'

    Plug 'dag/vim-fish'
    Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
    Plug 'ledger/vim-ledger'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/vim-github-dashboard'

    Plug 'godlygeek/tabular'
    Plug 'michal-h21/vim-zettel'
    Plug 'plasticboy/vim-markdown'
    Plug 'vimwiki/vimwiki'

    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-vinegar'
    Plug 'tpope/vim-speeddating'

    Plug 'airblade/vim-gitgutter'
    Plug 'flazz/vim-colorschemes'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
  call plug#end()
" }}}

" Theme {{{
  syntax on                                 " Syntax highlighting
  set background=dark                       " Dark background
  colorscheme solarized                     " Other options: pablo

  " Custom coloring/highlighting.
  highlight clear SignColumn                " SignColumn should match background
  highlight LineNr cterm=NONE ctermbg=NONE
  highlight MatchParen cterm=bold ctermbg=NONE ctermfg=15 term=standout
  highlight Comment cterm=italic
  highlight clear CursorLine
  highlight VertSplit cterm=NONE ctermbg=NONE
  highlight CursorLineNR cterm=bold ctermfg=226
  highlight IncSearch ctermfg=15 cterm=bold,underline term=standout
  highlight Search ctermfg=15 cterm=NONE term=standout ctermbg=NONE
" }}}

" Miscellaneous {{{
  " Folding {{{
    set foldenable                            " Enable folds
    set foldlevelstart=10                     " Opens most folds by default
    set foldnestmax=7                         " 8 nested fold max
    set foldmethod=syntax                     " Folding based on file syntax
  " }}}

  " Spacing {{{
    set tabstop=2 shiftwidth=2 softtabstop=2  " Default tabwidth
    set autoindent                            " Autoindent
    set expandtab                             " Tabs are spaces
    filetype plugin indent on                 " Load filetype-specific indentation

    " Language specific tabwidth
    autocmd Filetype go setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 textwidth=80
    autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
  " }}}

  " Search {{{
    set ignorecase                            " Ignore case of searches
    set incsearch                             " Dynamic highlighting
    set gdefault                              " Default global search flag
    set wrapscan                              " Wrap search around the file
  " }}}

  " Auto-complete {{{
    set wildmenu                                     " Command-line completion
    set wildmode=list:full                           " List all matches, and complete first
    set wildignore+=.hg,.git,.svn                    " Version control
    set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
    set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " Binary images
    set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " Compiled object files
    set wildignore+=*.spl                            " Compiled spelling lists
    set wildignore+=*.sw?                            " Vim swap files
    set wildignore+=*.DS_Store                       " OSX junk
    set wildignore+=*.orig                           " Merge resolution files
  " }}}

  " Undo/Backup/Swap {{{
    if !isdirectory(expand("~/.config/nvim/undo/"))
      silent !mkdir -p ~/.config/nvim/undo
    endif

    set undodir^=~/.config/nvim/undo/           " Directory to put undo files
    set undofile
    set nobackup                               " No backup files
    set nowritebackup                          " No backup files while editing
    set noswapfile                             " No swap files
  " }}}

" Language {{{
  " {{{ C/C++
    let g:clang_format#code_style = 'google'
    autocmd FileType c,cpp ClangFormatAutoEnable   " Toggle auto formatting
  " }}}
" }}}

  set lazyredraw                            " Faster rendering command options
  set noeol                                 " Don’t add empty line at EOF
  set showcmd                               " Show partial command while typing
  set ruler                                 " Show line/column number of cursor
  set shortmess=atIfilmnrxoOtT              " Skip intro message when starting
  set spell                                 " Spell checking on
  set nostartofline                         " Don't reset cursor to line start
  set cursorline                            " Highlight current cursor line
  set showmode                              " Show current mode
  set title                                 " Show filename in titlebar
  set showmatch                             " Highlight matching parenthesis
  set scrolloff=3                           " Scroll 3 lines before window edge
  set number                                " Line number setting
  set mouse=a                               " Automatically enable mouse usage
  set mousehide                             " Hide the mouse cursor while typing
  set hidden                                " Buffer settings
  set iskeyword-=.                          " '.' is an end of word designator
  set iskeyword-=#                          " '#' is an end of word designator
  set iskeyword-=-                          " '-' is an end of word designator
  set iskeyword-=/                          " '/' is an end of word designator
  set backspace=indent,eol,start            " Backspace for dummies
  set linespace=0                           " No extra spaces between rows
  set autowrite                             " Automatically save before :next
  set autoread                              " Automatically reread changed files
  set nowrap                                " Wrap long lines
  set splitright                            " New vsplit windows to the right
  set splitbelow                            " New split windows to the bottom
  set comments=sl:/*,mb:*,elx:*/            " Auto format comment blocks
  set modelines=1                           " Last line reserved for vim actions
  set linebreak                             " Wrap lines at convenient points
  set clipboard=unnamed                     " Use OS clipboard
  set shell=/usr/local/bin/fish             " Set default shell

  autocmd VimResized * wincmd =
  let mapleader = ","                       " Change mapleader
  scriptencoding utf-8                      " Default to UTF-8 encoding

  " Instead of reverting the cursor to the last position in the buffer, we
  " set it to the first line when editing a git commit message
  au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

  " Custom filetypes
  autocmd BufNewFile,BufRead *.log set filetype=crlog
  autocmd BufNewFile,BufRead *.ledger set filetype=ledger
  autocmd FileType ledger setlocal commentstring=;\ %s
" }}}

" Mappings {{{
  " Quicker exit from insert mode
  imap jk <Esc>l

  " Allow using the repeat operator with a visual selection (!)
  vnoremap . :normal .<CR>

  " For when you forget to sudo, really write the file
  cmap w!! w !sudo tee % >/dev/null

  " Move vertically by visual line
  nnoremap j gj
  nnoremap k gk
  nnoremap J gj
  nnoremap K gk

  noremap! <expr> ,T strftime("%B %d, %Y")

  " Search mappings: These will make it so that going to the next one in a
  " search will center on the line it's found in
  nnoremap n nzzzv
  nnoremap N Nzzz

  " Easier buffer navigation
  nnoremap <Tab> :bnext<CR>
  nnoremap <S-Tab> :bprevious<CR>

  " Do not show stupid q: window
  map q: :q

  " Space opens/closes folds
  nnoremap <space> za

  " Edit/load .vimrc bindings
  nnoremap <leader>ev :e $MYVIMRC<CR>
  nnoremap <leader>sv :source $MYVIMRC<CR>

  " Map Ctrl+V to paste, Ctrl+C to copy, paste shortcut with paste toggle
  imap <C-V> <C-R>*
  vmap <C-C> "+y
  nmap <C-V> "+p

  " Shift key fixes
  if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
  endif
" }}}

" Functions {{{
  " Toggle highlight search (,hs) {{{
    function! ToggleHighlightSearch()
      if(&hlsearch == 1)
        set nohls
      else
        set hls
      endif
    endfunction
    nnoremap <leader>hs :call ToggleHighlightSearch()<CR>
  " }}}

  " Toggle over length highlighting (,ol) {{{
    function! ToggleOverLengthIndicator()
        if g:over_length_hl_enabled
            highlight OverLength ctermbg=NONE ctermfg=NONE cterm=NONE
            let g:over_length_hl_enabled = 0
        else
            highlight OverLength ctermbg=NONE ctermfg=red cterm=bold
            let g:over_length_hl_enabled = 1
        endif
    endfunction
    let g:over_length_hl_enabled = 1
    highlight OverLength ctermbg=NONE ctermfg=NONE cterm=NONE
    match OverLength /\%81v.\+/
    nnoremap <leader>ol :call ToggleOverLengthIndicator()<CR>
  " }}}

  " Toggle fold (, ) {{{
    function! ToggleFold()
      if(&foldlevel == 0)
        set foldlevel=99
      else
        set foldlevel=0
     endif
    endfunc
    noremap <leader><space> :call ToggleFold()<CR>
  " }}}

  " Change to directory of current file, window specific (,lcd) {{{
    function! LocallyChangeCurrentDirectory()
      lcd %:p:h
    endfunction
    nnoremap <leader>lcd :call LocallyChangeCurrentDirectory()<CR>
  " }}}

  " Change to directory of current file (,cd) {{{
    function! ChangeCurrentDirectory()
      cd %:p:h
    endfunction
    nnoremap <leader>cd :call ChangeCurrentDirectory()<CR>
  " }}}

  " Strip trailing white space (,sw) {{{
    function! StripWhiteSpace()
      let save_cursor = getpos(".")
      let old_query = getreg('/')
      :%s/\s\+$//e
      call setpos('.', save_cursor)
      call setreg('/', old_query)
    endfunction
    nnoremap <leader>sw :call StripWhiteSpace()<CR>
  " }}}
  " }}}

" Plugin Configuration {{{
  " vim-markdown {{{
    let g:vim_markdown_strikethrough = 1
    let g:vim_markdown_frontmatter = 0
    let g:vim_markdown_follow_anchor = 1
    " let g:vim_markdown_new_list_item_indent = 2
  " }}}

  " syntastic {{{
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_quiet_messages = { "type": "style" }
    let g:syntastic_always_populate_loc_list = 0
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0
    let g:syntastic_aggregate_errors = 1
    let g:syntastic_cpp_compiler = 'g++'
    let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
    let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
  " }}}

  " vim-airline {{{
    set t_Co=256
    let g:airline_powerline_fonts = 0
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme = 'lucius'         " Lucius, Base16, or Solarized
    set laststatus=2                       " To show status bar on startup
  " }}}

  " vim-go {{{
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_interfaces = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_fmt_command = "goimports"

    au FileType go nmap <leader>gr <Plug>(go-run)
    au FileType go nmap <leader>gb <Plug>(go-build)
    au FileType go nmap <leader>gt <Plug>(go-test)
    au FileType go nmap <leader>gc <Plug>(go-coverage)
    au FileType go nmap <leader>gds <Plug>(go-def-split)
    au FileType go nmap <leader>gd <Plug>(go-doc)
    au FileType go nmap <leader>gdb <Plug>(go-doc-browser)
    au FileType go nmap <leader>gi <Plug>(go-info)
    au FileType go nmap <leader>gdv <Plug>(go-def-vertical)
    au FileType go nmap <leader>gs <Plug>(go-implements)
  " }}}

  " FastFold {{{
    let g:fastfold_savehook = 0
    let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
    let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
    let g:vimsyn_folding = 'af'
    let g:tex_fold_enabled = 1
  " }}}

  " vim-crlfmt {{{
    let g:crlfmt_options = '-fast -ignore ".*.pb(.gw)?.go -tab 2 -w"'
  " }}}

  " vim-speeddating {{{
    " In vim-speeddating/after/plugged/speeddating.vim:
      " SpeedDatingFormat %B-%d
  " }}}

  " vim-easy-align {{{
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
  " }}}

  " vimwiki {{{
    " Duplicating the entry here due to https://github.com/michal-h21/vim-zettel/issues/10.
    let g:vimwiki_list = [
      \ {
        \ 'path': '~/Software/src/github.com/irfansharif/wiki',
        \ 'name': "@irfansharif's wiki",
        \ 'auto_toc': 0,
        \ 'auto_tags': 0,
        \ 'auto_diary_index': 0,
        \ 'auto_generate_links': 0,
        \ 'auto_generate_tags': 0,
        \ 'links_space_char': '-',
        \ 'syntax': 'markdown',
        \ 'ext': '.md',
      \ }]

    let g:vimwiki_key_mappings = { 'all_maps': 0 }    " Disable all key mapping by default
    let g:vimwiki_hl_cb_checked = 2                   " Colors checked off items with comment-like syntax
    let g:vimwiki_global_ext = 0                      " Only use vimwiki within configured spaces
    let g:vimwiki_listsyms = ' -x'                    " Progression of checklist item (alternatively ○◐●)
    let g:vimwiki_listsym_rejected = '/'              " Rejected checklist item (alternatively: ⨯)
    let g:vimwiki_folding = 'list:quick'              " Use list folding for checklist view summarization
    let g:vim_markdown_folding_disabled = 1           " Disable plasticboy/vim-markdown folding
    let g:vimwiki_conceal_pre = 1                     " Conceal code annotations
    let g:vimwiki_links_header = 'Links'
    let g:vimwiki_tags_header = 'Tags'

    nmap = <Plug>VimwikiAddHeaderLevel
    nmap - <Plug>VimwikiRemoveHeaderLevel
    nmap [[ <Plug>VimwikiGoToPrevHeader
    nmap ]] <Plug>VimwikiGoToNextHeader
    nmap <C-]> :w<cr><Plug>VimwikiFollowLink
    nmap <C-[> :w<cr><Plug>VimwikiGoBackLink

    " Option + {j,k,[,]}
    nmap ∆ <Plug>VimwikiNextLink
    nmap ˚ <Plug>VimwikiPrevLink
    nmap ‘ :w<cr><Plug>VimwikiVSplitLink
    nmap “ :w<cr>:bd<cr>

    " List subcommands: Ctrl+{ ,/,-,n}
    nmap <C-Space> <Plug>VimwikiToggleListItem
    nmap  <Plug>VimwikiToggleRejectedListItem
    nmap  <Plug>VimwikiIncrementListItem
    nmap <C-n> <Plug>VimwikiNextTask

    nmap gll <Plug>VimwikiIncreaseLvlWholeItem
    nmap glh <Plug>VimwikiDecreaseLvlWholeItem
    nmap glr <Plug>VimwikiRenumberAllLists

    nnoremap gl# :VimwikiChangeSymbolInListTo #<CR>
    nnoremap gl+ :VimwikiChangeSymbolInListTo +<CR>
    nnoremap gl* :VimwikiChangeSymbolInListTo *<CR>
    nnoremap gl- :VimwikiChangeSymbolInListTo -<CR>
    nnoremap gl1 :VimwikiChangeSymbolInListTo 1.<CR>

    " Define custom list <CR> behavior. See :h vimwiki, section 8.
    autocmd FileType vimwiki inoremap <silent><buffer> <CR>
            \ <C-]><Esc>:VimwikiReturn 3 5<CR>

    " TODO shortcut to undo linkifying.
    " TODO Quickfix list navigation
    " TODO Tables (sec 9)
    " TODO scripts to run link repair, link rename, table updates.
    " TODO Swap buffers when navigation, don't just collect it
    "
    " VimwikiGenerateLinks, VimwikiGenerateTagLinks, VimwikiTOC
    " VimwikiRebuildTags, VimwikiSearchTags. VimwikiDiaryGenerateLinks,
    " VimwikiCheckLinks, VimwikiBacklinks
    " VimwikiTable
  " }}}

  " vim-zettel {{{
    let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=never"
    let g:zettel_format = "%y%m%d-%file_alpha%file_no-%title"
    let g:zettel_date_format = "%y/%m/%d"
    let g:zettel_options = [{"front_matter" : {"tags" : ""}, "template" : "~/Software/src/github.com/irfansharif/wiki/tpl/zettel.tpl"}]

    nmap <Leader>zz <Plug>VimwikiIndex
    nmap <Leader>zd <Plug>VimwikiDeleteFile
    nmap <Leader>zmv <Plug>VimwikiRenameFile

    nnoremap <leader>zo :ZettelOpen<cr>
    nnoremap <leader>zn :ZettelNew<space>
    nnoremap <leader>zi :ZettelInbox<cr>
    nnoremap <leader>zs :ZettelSearch<cr>
    nnoremap <leader>zt :VimwikiSearchTags<space>
    nnoremap <leader>zy :ZettelYankName<cr>
    nnoremap <leader>zb :ZettelBackLinks<cr>
    nnoremap <leader>zgi :ZettelGenerateLinks<cr>
    nnoremap <leader>zgt :VimwikiRebuildTags!<cr>:VimwikiGenerateTagLinks<cr><c-l>
  " }}}

" fzf.vim {{{
    autocmd! FileType fzf
    autocmd  FileType fzf set noshowmode noruler nonu

    if exists('$TMUX')
      let g:fzf_layout = { 'tmux': '-p90%,60%' }
    else
      let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
    endif

    function! RipgrepFzf(query, fullscreen)
      let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
      let initial_command = printf(command_fmt, shellescape(a:query))
      let reload_command = printf(command_fmt, '{q}')
      let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
      call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
    endfunction
    command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

    nnoremap <Leader><Leader>f :Files<CR>
    nnoremap <Leader><Leader>t :RG<CR>

    imap <c-o><c-f> <plug>(fzf-complete-path)
" }}}
" }}}

" vim:foldmethod=marker:foldlevel=0
