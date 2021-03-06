" Load all the required bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Map the leader key to ,
let mapleader=","
let g:mapleader=","

" Vim settings
set hidden
set cursorline
set expandtab
set modelines=5
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=128
set ttyscroll=10
set encoding=utf-8
set tabstop=2
set laststatus=2
set nowrap
set number
set relativenumber
set expandtab
set nowritebackup
set noshowmode
set noswapfile
set nobackup
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set nofoldenable
set whichwrap+=<,>,h,l,[,]

" Set terminal color
set t_Co=256
set term=xterm-256color
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Make backspace work in insert mode
set backspace=indent,eol,start

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Color scheme
let hour = strftime("%H")
" if 6 <= hour && hour < 18
"   set background=light
" else
"   set background=dark
" endif
set background=dark
colorscheme gruvbox

filetype plugin indent on

" Quick ESC
imap jj <ESC>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /<CR>
map <c-space> ?<CR>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Jump to the next row on long lines
map <Down> gj
map <Up>   gk
nnoremap j gj
nnoremap k gk

" Toggle paste mode on and off
map <silent> <leader>pp :setlocal paste!<cr>

" Always use vertical diffs
set diffopt+=vertical

" Open new buffers
nmap <leader>s<left>   :leftabove  vnew<cr>
nmap <leader>s<right>  :rightbelow vnew<cr>
nmap <leader>s<up>     :leftabove  new<cr>
nmap <leader>s<down>   :rightbelow new<cr>

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" Buffer switching
nnoremap gb :ls<CR>:b<Space>

" Close the current buffer
map <leader>bd :Bclose<CR>

" Shortcut to reload vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Remap F1 from Help to ESC.  No more accidents.
nmap <F1> <Esc>
map! <F1> <Esc>

" Support Tagbar
nmap <F8> :TagbarToggle<CR>

" Remove YCM keys
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" "" Neocomplete settings
" " Enable Neocomplete
" let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
" let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 3

" " Define dictionary.
" let g:neocomplete#sources#dictionary#dictionaries = {
"     \ 'default' : '',
"     \ 'vimshell' : $HOME.'/.vimshell_hist',
"     \ 'scheme' : $HOME.'/.gosh_completions'
"         \ }

" " Define keyword.
" if !exists('g:neocomplete#keyword_patterns')
"     let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" " Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()

" " Recommended key-mappings.
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
"   " For no inserting <CR> key.
"   "return pumvisible() ? "\<C-y>" : "\<CR>"
" endfunction
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" " " go language
" let s:tlist_def_go_settings = 'go;g:enum;s:struct;u:union;t:type;' .
"                            \ 'v:variable;f:function'

" Disable vroom
let g:vroom_map_keys = 0

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " Filetype modelines 
  autocmd FileType ruby,eruby,yaml set autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType vim set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType puppet set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab commentstring=#\ %s
  autocmd FileType perl set autoindent tabstop=4 shiftwidth=4 softtabstop=4 expandtab
  autocmd FileType xml set autoindent tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab
  " treat rackup files like ruby
  au BufRead,BufNewFile *.ru set ft=ruby
  au BufRead,BufNewFile Gemfile set ft=ruby
  au BufRead,BufNewFile Vagrantfile set ft=ruby
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Vim-vroom
let g:vroom_use_vimux = 1

" tcl.vim
let tcl_extended_syntax = 1

"" NERDTree
"" Launch on start
""autocmd VimEnter * NERDTree
""autocmd VimEnter * wincmd p
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"" Auto close NERDTree if last buffer
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

""nmap <leader>n :NERDTreeToggle<CR>
"map <leader>n <plug>NERDTreeTabsToggle<CR>
"let NERDTreeHighlightCursorline=1
"let NERDTreeQuitOnOpen = 1
"let NERDTreeShowHidden = 1
"let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg', '\.git', '\.svn']
""map <C-o> :NERDTreeToggle %<CR>

"" Check if NERDTree is open or active
"function! s:isNERDTreeOpen()        
"  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction
 
"" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
"" file, and we're not in vimdiff
"function! s:syncTree()
"  if &modifiable && s:isNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"    NERDTreeTabsFind
"    wincmd p
"  endif
"endfunction
 
"" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call s:syncTree()

" Syntastic
" let g:syntastic_mode_map = { 'mode': 'active' }
" let g:syntastic_ruby_exec = '~/.rvm/rubies/ruby-2.4.1/bin/ruby'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CtrlP
nnoremap <silent> t :CtrlP<cr>
let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 600
let g:ctrlp_max_depth = 5

" CtrlPObsession
nnoremap <Leader>ss :CtrlPObsession<CR>

" Utilsnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Airline
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'solarized'
let g:airline_theme = 'powerlineish'
let g:airline#extensions#tmuxline#enabled = 0

" Tabularize
if exists(":Tabularize")
  nmap <silent> <Leader>a= :Tabularize /=<CR>
  vmap <silent> <Leader>a= :Tabularize /=<CR>
  nmap <silent> <Leader>a: :Tabularize /:\zs<CR>
  vmap <silent> <Leader>a: :Tabularize /:\zs<CR>
endif

" Vim-terraform
let g:terraform_fmt_on_save = 1

" Lightline config
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], ['sessionname'], 
      \             [ 'fugitive', 'filename' ], ['ctrlpmakr', 'rvm'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'rvm': '%{rvm#statusline()}',
      \   'obsession': '%{ObsessionStatus(''T'','''')}'
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'filename': 'MyFilename',
      \   'sessionname': 'SessionName',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" Lightline functions
function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "\ue0a2"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? "\ue0a0 "._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! SessionName()
  return matchstr(v:this_session, '\v\%\zs(\a*)\.vim')
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
  autocmd BufWritePost *.pp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

" Set the terminal title
"let &titlestring = $USER . "@" . hostname() . ": vim " . expand("%:t")
"if &term == "screen"
"  set t_ts=^[k
"  set t_fs=^[\
"endif
"if &term == "screen" || &term == "xterm"
"  set title
"endif
set title
"autocmd BufRead * let &titlestring = expand("%:p")
set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

 " Disable AutoComplPop.
 let g:acp_enableAtStartup = 0
 " Use neocomplete.
 let g:neocomplete#enable_at_startup = 1
 " Use smartcase.
 let g:neocomplete#enable_smart_case = 1
 " Set minimum syntax keyword length.
 let g:neocomplete#sources#syntax#min_keyword_length = 3

 " Plugin key-mappings.
 inoremap <expr><C-g>     neocomplete#undo_completion()
 inoremap <expr><C-l>     neocomplete#complete_common_string()

 " Recommended key-mappings.
 " <CR>: close popup and save indent.
 inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
 function! s:my_cr_function()
     return neocomplete#close_popup() . "\<CR>"
 endfunction
 " <TAB>: completion.
 inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
 " <C-h>, <BS>: close popup and delete backword char.
 inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
 inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
 inoremap <expr><C-y>  neocomplete#close_popup()
 inoremap <expr><C-e>  neocomplete#cancel_popup()

 " Go related mappings
 au FileType go nmap <Leader>i <Plug>(go-info)
 au FileType go nmap <Leader>gd <Plug>(go-doc)
 au FileType go nmap <Leader>r <Plug>(go-run)
 au FileType go nmap <Leader>b <Plug>(go-build)
 au FileType go nmap <Leader>t <Plug>(go-test)
 au FileType go nmap gd <Plug>(go-def-tab)

 " By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" Python syntax args
let g:syntastic_python_flake8_args='--ignore=E501,E225'

"#############################
" Useful functions below
"#############################

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.pp :call DeleteTrailingWS()


" " Autoload NERDTree if no file
" function! StartUp()
"     if 0 == argc()
"         NERDTree
"     end
" endfunction

" autocmd VimEnter * call StartUp()

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Autoreload vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Disable YCM
let g:loaded_youcompleteme = 1
