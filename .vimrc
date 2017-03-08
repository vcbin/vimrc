set t_Co=256 " required by airline or powerline font color
set hidden " required by vim-ctrlspace

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'wincent/command-t'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
"Plugin 'file://~/.vim/bundle/syntastic'
Plugin 'a.vim'
Plugin 'scrooloose/syntastic'
"Plugin 'file://~/.vim/bundle/Tagbar'
"Plugin 'file://~/.vim/bundle/vim-airline'
"Plugin 'file://~/.vim/bundle/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'taglist.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rking/ag.vim'
Plugin 'mileszs/ack.vim'
Plugin 'mhinz/vim-grepper'
Plugin 'kien/ctrlp.vim'
Plugin 'hari-rangarajan/CCTree'
"Plugin 'file://~/.vim/bundle/tabular' "similar to 'vim-easy-align'
"Plugin 'file://~/.vim/bundle/nerdtree'
Plugin 'emezeske/manpageview'
Plugin 'grep.vim'
Plugin 'tpope/vim-abolish.git' " https://github.com/tpope/vim-abolish
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'vim-ctrlspace/vim-ctrlspace'
"Plugin 'winmanager' " conflict with <cr> mapping
"Plugin 'TabBar'
Plugin 'csv.vim'
Plugin 'edkolev/promptline.vim'
Plugin 'Valloric/ListToggle'
"Plugin 'luochen1990/rainbow'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'gregsexton/MatchTag'
Plugin 'tmhedberg/matchit'
Plugin 'matchit.zip'
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'mbbill/undotree'
Plugin 'flazz/vim-colorschemes'
"Plugin 'felixhummel/setcolors.vim'
Plugin 'Valloric/YouCompleteMe'

"Plugin 'AutoComplPop'
Plugin 'ingo-library'
Plugin 'QuickFixCurrentNumber' "be dependent on 'ingo-library'
Plugin 'docunext/closetag.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'Raimondi/delimitMate'
Plugin 'junegunn/vim-easy-align'
Plugin 'Crapworks/python_fn.vim' "python code block motion/jumping
"Plugin 'ap/vim-buftabline'
Plugin 'Chun-Yang/vim-action-ag'
Plugin 'kien/tabman.vim'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-characterize'
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'pangloss/vim-javascript'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-unimpaired'
"Plugin 'tmhedberg/SimpylFold'
Plugin 'LucHermitte/lh-vim-lib'
"Plugin 'LucHermitte/VimFold4C'
"Plugin 'skywind3000/asyncrun.vim'
Plugin 'kana/vim-operator-user'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'DoxygenToolkit.vim'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'Flowerowl/ici.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'skywind3000/asyncrun.vim' " vim 8.0 only
"Plugin 'rhysd/vim-clang-format' " freeze the editor , typing is stuttering as hell
"Plugin 'joonty/vdebug'

"Plugin 'terryma/vim-multiple-cursors' " FREEZE the entire program !!!
"Plugin 'file://~/.vim/bundle/grep'
"Plugin 'klen/python-mode'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set runtimepath^=~/.vim/bundle/ag

filetype indent on
set autoindent
set hlsearch

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" change the mapleader from \ to ,
let mapleader=","

inoremap jj <esc>

nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>

" for vim play nice with tmux
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

"nnoremap <S-Enter> O<Esc> # not works for console version
nnoremap <CR> o<Esc>

" Toggle line number display
nnoremap <Leader>ln :set nonumber!<CR>

" ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" 设置过滤不进行查找的后缀名

" fast replace the word under cursor
:nnoremap <Leader>r :,$s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

nnoremap <F5> :UndotreeToggle<cr>
nnoremap <F6> :NERDTreeToggle<CR>
nnoremap <F7> :TagbarToggle<CR>
nnoremap <F9> :Tlist<CR>

" airline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
"" show buffer number
"let g:airline#extensions#tabline#buffer_nr_show = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1 " https://github.com/powerline/fonts
set laststatus=2

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set autoread
set number
syntax enable

let g:load_doxygen_syntax=1
nnoremap dox :Dox<CR>

"cnoremap <C-A> <Home>
"cnoremap <C-F> <Right>
"cnoremap <C-B> <Left>
"cnoremap <Esc>b <S-Left>
"cnoremap <Esc>f <S-Right>

nnoremap <Space> i<Space><Esc>

let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

""http://vim.wikia.com/wiki/Using_tab_pages
""not working with multiple windows
"set switchbuf=usetab
"nnoremap <F8> :sbnext<CR>
"nnoremap <S-F8> :sbprevious<CR>

"" The "^[" is a single character. You enter it by pressing Ctrl+v and then ESC.
"set t_8f=^[[38;2;%lu;%lu;%lum
"set t_8b=^[[48;2;%lu;%lu;%lum

"" Change the color scheme here.
"colorscheme gruvbox

"" Makes the background transparent. Leave these out if you're not using a transparent
"" terminal.
"highlight Normal ctermbg=NONE guibg=NONE
"highlight NonText ctermbg=NONE guibg=NONE

"" This is what sets vim to use 24-bit colors. It will also work for any version of neovim
"" newer than 0.1.4.
"set termguicolors

colorscheme gruvbox
set background=dark
nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>
nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

"colorscheme 256-jungle
"colorscheme molokai
"colorscheme visualstudio " this one is horrible in terminal

"scroll screen with the find next/previous command
nnoremap n nzz
nnoremap N Nzz

"Bundle 'Valloric/YouCompleteMe'
" for ycm
"let g:loaded_youcompleteme = 1 " disable ycm, conflict with acp plugin
"let g:ycm_show_diagnostics_ui = 0 " pep8 error is annoying!!
let g:ycm_auto_trigger = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F4> :YcmDiags<CR>
"inoremap <c-o> <c-x><c-o>
let g:ycm_semantic_triggers = {
  \     'c' : ['->', '  ', '.', ' ', '(', '[', '&'],
  \     'cpp,objcpp' : ['->', '.', ' ', '(', '[', '&', '::'],
  \     'perl' : ['->', '::', ' '],
  \     'php' : ['->', '::', '.'],
  \     'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
  \     'ruby' : ['.', '::'],
  \     'lua' : ['.', ':']
  \ }

" winManager
"let g:winManagerWindowLayout="NERDTree|TagList"
"let g:NERDTree_title="[NERDTree]"

"" winmanager to merge multi panel
"nnoremap <C-m> :WMToggle<CR>

"function! NERDTree_Start()
"exec 'NERDTree'
"endfunction

"function! NERDTree_IsValid()
"return 1
"endfunction

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

"" Move to word, conflict with CamelCaseMotion and extremly SLOW!!
"noremap  <Leader>w <Plug>(easymotion-bd-w)
"nnoremap <Leader>w <Plug>(easymotion-overwin-w)

" Jump to anywhere you want with minimal keystrokes, with just two key binding.
" `<Leader>s{char}{label}`
nmap <Leader>s <Plug>(easymotion-overwin-f)
" or
" `<Leader>s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

" incsearch.vim x fuzzy x vim-easymotion
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

" for python docstring ", 特别有用
au FileType python let b:delimitMate_nesting_quotes = ['"']
" 关闭某些类型文件的自动补全
"au FileType mail let b:delimitMate_autoclose = 0

" closetag
let g:closetag_html_style=1

" EasyAlign
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }

"let g:multi_cursor_use_default_mapping=0
"" Default mapping
"let g:multi_cursor_next_key='<leader>m'
"let g:multi_cursor_prev_key='<leader>p' " conflict with ctrl-p plugin
"let g:multi_cursor_skip_key='<leader>x'
"let g:multi_cursor_quit_key='<Esc>'

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" rainbow parentheses
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}


"functiona g:UltiSnips_Complete()
    "call UltiSnips#ExpandSnippet()
    "if g:ulti_expand_res == 0
        "if pumvisible()
            "return "\<C-n>"
        "else
            "call UltiSnips#JumpForwards()
            "if g:ulti_jump_forwards_res == 0
               "return "\<TAB>"
            "endif
        "endif
    "endif
    "return ""
"endfunction

"au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsListSnippets="<c-e>"
"" this mapping Enter key to <C-y> to chose the current highlight item
"" and close the selection list, same as other IDEs.
"" CONFLICT with some plugins like tpope/Endwise
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetsDir = '~/.vim/bundle/vim-snippets/UltiSnips'
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:snips_author = 'Yi Liu'
let g:snips_author_email = '01929@mgtv.com'
let g:snips_author_homepage = 'http://blog.csdn.net/vcbin'

" http://howiefh.github.io/2015/05/22/vim-install-youcompleteme-plugin/
" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB key
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" Expand snippet or return
let g:ulti_expand_res = 1
function! Ulti_ExpandOrEnter()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ''
    else
        return "\<return>"
endfunction

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

"unlet g:ctrlp_custom_ignore
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$',
  \ 'file': '\.exe$\|\.so$\|\.dat$\|\.pyc$'
  \ }

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>br :CtrlPMRU<cr>

" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Looper buffers
"let g:buffergator_mru_cycle_loop = 1

" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>

" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>

" Shared bindings from Solution #1 from earlier
nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>
" Buffergator default key remapping
nnoremap <Leader>bg :BuffergatorOpen<cr>

set tags=./tags,tags;$HOME

let strip_whitespace_on_save = 1

"enable spell checking
setlocal spell spelllang=en_us

set tabstop=4
set shiftwidth=4
set expandtab

" insert newline after brackets/parentheses for long arguments
nnoremap icr i<cr><esc><s-v>=

" Select lines with V, hit leader z a.
"Everything above and below will be folded.
vnoremap <Leader>za <Esc>`<kzfgg`>jzfG`<
" unfold everything back
nmap <silent><Leader>zs <Esc>zRzz

"let g:SimpylFold_docstring_preview = 1
"autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
"autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

"set foldmethod syntax

"fold for c++
let g:fold_options = {
   \ 'show_if_and_else': 1,
   \ 'strip_template_argurments': 1,
   \ 'strip_namespaces': 1,
   \ }

"For more recent versions of vim (tested on 7.4):
set listchars=tab:>-     " > is shown at the beginning, - throughout

"quick format current line in normal mode
nnoremap v= <s-v>=

" quick ici dict searching, sudo `which pip` install ici first,
nmap <Leader>y :!echo --==<C-R><C-w>==-- ;ici <C-R><C-W><CR>

"let g:clang_format#style_options = {
            "\ "AccessModifierOffset" : -4,
            "\ "AllowShortIfStatementsOnASingleLine" : "true",
            "\ "AlwaysBreakTemplateDeclarations" : "true",
            "\ "Standard" : "C++11"}

"" map to <Leader>cf in C++ code
"autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
"autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
"" if you install vim-operator-user
"autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
"" Toggle auto formatting:
"nmap <Leader>C :ClangFormatAutoToggle<CR>
"autocmd FileType c ClangFormatAutoEnable


map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie


" AWK Embedding:
" ==============
" Shamelessly ripped from aspperl.vim by Aaron Hope.
if exists("b:current_syntax")
    unlet b:current_syntax
endif
syn include @AWKScript syntax/awk.vim
syn region AWKScriptCode matchgroup=AWKCommand start=+[=\\]\@<!'+ skip=+\\'+ end=+'+ contains=@AWKScript contained
syn region AWKScriptEmbedded matchgroup=AWKCommand start=+\<awk\>+ skip=+\\$+ end=+[=\\]\@<!'+me=e-1 contains=@shIdList,@shExprList2 nextgroup=AWKScriptCode
syn cluster shCommandSubList add=AWKScriptEmbedded
hi def link AWKCommand Type

"let g:rainbow_active = 1
