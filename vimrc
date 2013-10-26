let mapleader = ","

source ~/.vim/vundle.vim

syntax enable               "syntax highlighting

set bg=dark                 "for dark background consoles

set tabstop=4               "tab = 4 spaces
set softtabstop=4           "tab = 4 spaces
set shiftwidth=4            "tab = 4 spaces
set expandtab               "turn tabs in spaces

set number
if exists("&relativenumber")
    set norelativenumber
endif

nnoremap / /\v
vnoremap / /\v
nnoremap Y y$
nnoremap Q gq
set ignorecase              "ignore case in searches
set smartcase
set gdefault
set hlsearch                "highlight search items"

set modeline                "read modeline from files"
set modelines=5             "look for modelines in first 5 lines"

set copyindent              "copy the previous indentation on autoindenting
set hidden                  "hide buffers instead of closing them

"" wrapping stuff
set wrap
set textwidth=0             "When wrapping is off, break lines at 78 chars
set formatoptions=qrn1
if exists("&colorcolumn")
    set colorcolumn=80,81,82
    hi ColorColumn ctermbg=black guibg=grey10
endif

set wildmode=list:longest
set wildignore+=*.o,*.obj,*.pyc,*.class,.git,node_modules,lib-cov

"" TOhtml stuff
let html_use_css=1          "use css in HTML output
let use_xhtml=1             "use xhtml in HTML output

"" miniBufferExplorer stuff
let g:miniBufExplMapWindowNavVim = 1    "map <control> vim navigaiton keys
let g:miniBufExplMapWindowNavArrows = 1 "map <control> arrow keys
let g:miniBufExplMapCTabSwitchBufs = 1  "map <control> tab key
let g:miniBufExplModSelTarget = 1       "because I use taglist as well
"let g:miniBufExplForceSyntaxEnable = 1  "fix a bug with syntax in 6.3.1

"" Folding
set foldmethod=indent       "fold based on identation 
set nofen                   "open all folds initially

set printoptions=paper:letter,number:y

"" some system specific commmands
if has("mac")
    iab  rtime   <ESC>:r!gdate -R<CR>i<BS><ESC>A
elseif has("unix")
    iab  rtime   <ESC>:r!date -R<CR>i<BS><ESC>A
endif

"" toggle margins
map ;L ;on-m
map ;off-m      :set textwidth=0\|map ;L ;on-m<CR>
map ;on-m       :set textwidth=78\|map ;L ;off-m<CR>

" Change <tab>s to spaces
map ;T :retab<CR>

nnoremap j gj
nnoremap k gk

"" GNU readline bindings
map <C-A>   <Home>
map <C-E>   <End>
map <C-F>   <Right>
map <C-B>   <Left>
map <ESC>b  <S-Left>
map <ESC>f <S-Right>

" Textmate like text movement
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Visually select the text that was last edited/pasted
nmap gV `[v`]

"" F key toggles
map <F7>    :set relativenumber!<CR>
map <F8>    :set paste!<CR>
map <F9>    :set wrap!<CR>

map <F10>   :Tlist<CR>
map <F11>   :wa!<CR>:!aspell -c --dont-backup "%"<CR>:e! "%"<CR><CR>
map <F12>   :wa!<CR>:make<CR>

"" smart tab completion
" function! Smart_TabComplete()
"   let line = getline('.')                         " curline
"   let substr = strpart(line, -1, col('.'))      " from start to cursor
"   let substr = matchstr(substr, "[^ \\t]*$")       " word till cursor
"   if (strlen(substr)==0)                          " nothing to match on empty string
"     return "\\<tab>"
"   endif
"   let has_period = match(substr, '\\.') != -1      " position of period, if any
"   let has_slash = match(substr, '\\/') != -1       " position of slash, if any
"   if (!has_period && !has_slash)
"     return "\\<C-X>\\<C-P>"                         " existing text matching
"   elseif ( has_slash )
"     return "\\<C-X>\\<C-F>"                         " file matching
"   else
"     return "\\<C-X>\\<C-O>"                         " plugin matching
"   endif
" endfunction
" :inoremap <Tab> <C-R>=Smart_TabComplete()<CR>

" The <CR> key should select from completion menu without adding a newline
"imap <expr> <CR> pumvisible() ? "<C-Y>" : "<CR>"
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:SuperTabDefaultCompletionType = "context"

set verbose=0

set list
nmap <silent> <leader>s :set nolist!<CR>
nmap <silent> <leader>n :silent :nohlsearch<CR>
nmap . .`[

" GIT
" set laststatus=2
" set statusline=%<%f[%{GitBranch()}]\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" set statusline=%<%f\ %3*%{strlen(&ft)?&ft:'none'}%*\ %4*%{fugitive#statusline()}%*%h%m%r%=%-14.(%l,%c%V%)\ %P

" From https://gist.github.com/840731
set statusline=\ "
set statusline+=%-25.80f\ " file name minimum 25, maxiumum 80 (right justified)
set statusline+=%h "help file flag
set statusline+=%r "read only flag
set statusline+=%m "modified flag
set statusline+=%w "preview flag
set statusline+=\ "
set statusline+=[
set statusline+=%{strlen(&ft)?&ft:'none'} " filetype
set statusline+=]\ "
set statusline+=%1*%{fugitive#statusline()}%*\ " Fugitive
"set statusline+=%5*%{Rvm#statusline()}%*\ " RVM
set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%* " Syntastic Syntax Checking
set statusline+=%= " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

" Don't count warnings as errors
" let g:syntastic_quiet_warnings=1
let g:syntastic_stl_format = '%E{[Err: %fe #%e]}'

au BufRead,BufNewFile *.thrift set filetype=thrift
au BufRead,BufNewFile *.json set filetype=json

if has("autocmd")
    autocmd Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap

    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType coffee setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 nolist

    " http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
    autocmd BufReadPost fugitive://* set bufhidden=delete
    autocmd User fugitive
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif
endif
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" Removes trailing spaces
command! TrimWhiteSpace %s/\v\s+$//

" SaveasSamePath saves with new name to same path (all one line)
" via http://vim.1045645.n5.nabble.com/How-to-make-saveas-default-to-original-file-s-directory-td2827361.html
command! -nargs=1 SaveasSamePath exe "saveas " . expand("%:p:h") . "/" . expand("<args>")

if (&t_Co == 256 || &t_Co == 88) && !has('gui_running')
  " Use the guicolorscheme plugin to makes 256-color or 88-color
  " terminal use GUI colors rather than cterm colors.
  runtime! bundle/guicolorscheme.vim/plugin/guicolorscheme.vim
  GuiColorScheme twilight
endif

" ConqueTerm settings
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_CWInsert = 1

" Makes it easy to run a shells
" example: can do ":Node %" to run the current file
command! -nargs=* -complete=file Shell ConqueTermSplit <args>
command! -nargs=* -complete=file Zsh ConqueTermSplit zsh <args>
command! -nargs=* -complete=file Node ConqueTermSplit node <args>
command! -nargs=* -complete=file Python ConqueTermSplit python <args>

" use python json to Tidy a file
command! -range=% -nargs=* Json <line1>,<line2>!python -mjson.tool <args>

" Support xterm mouse
set mouse=a

" Support bracketed paste
" http://stackoverflow.com/questions/5585129/pasting-code-into-terminal-window-into-vim-on-mac-os-x/7053522#7053522
if &term =~ "xterm.*"
    let &t_ti = "\<Esc>[?2004h" . &t_ti
    let &t_te = "\<Esc>[?2004l" . &t_te

    function! XTermPasteBegin(ret)
      set pastetoggle=<Esc>[201~
      set paste
      return a:ret
    endfunction

    execute "set <f28>=\<Esc>[200~"
    execute "set <f29>=\<Esc>[201~"
    map <expr> <f28> XTermPasteBegin("i")
    imap <expr> <f28> XTermPasteBegin("")
    vmap <expr> <f28> XTermPasteBegin("c")
    cmap <f28> <nop>
    cmap <f29> <nop>
endif

" A motion for the current match.
" Lets you do "ci/" to change the current match
" via http://stackoverflow.com/questions/8694250/vim-incremental-search-how-to-copy-the-the-matched-string-under-cursor/8694439#8694439
vnoremap <silent> i/ :<c-u>call SelectMatch()<cr>
onoremap <silent> i/ :call SelectMatch()<cr>
function! SelectMatch()
    if search(@/, 'bcW')
        norm! v
        call search(@/, 'ceW')
    else
        norm! gv
    endif
endfunction

" For vim-gitgutters
highlight clear SignColumn

if has("unix")
  set directory=~/.vim/swap
  set backupdir=~/.vim/backup
  set undodir=~/.vim/undo
  set undofile
endif

" For vim-airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_c='%{fnamemodify(getcwd(), ":t")} %f%m'

function! DeleteInactiveBufs()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    "Below originally inspired by Hara Krishna Dara and Keith Roberts
    "http://tech.groups.yahoo.com/group/vim/message/56425
    let nWipeouts = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bwipeout' i
            let nWipeouts = nWipeouts + 1
        endif
    endfor
    echomsg nWipeouts . ' buffer(s) wiped out'
endfunction
command! Bdi :call DeleteInactiveBufs()
