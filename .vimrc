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
Plugin 'git://git.wincent.com/command-t.git'
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
Plugin 'scrooloose/syntastic'
"Plugin 'file://~/.vim/bundle/Tagbar'
"Plugin 'file://~/.vim/bundle/vim-airline'
"Plugin 'file://~/.vim/bundle/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'file://~/.vim/bundle/ag'
"Plugin 'file://~/.vim/bundle/nerdcommenter'
Plugin 'file://~/.vim/bundle/ctrlp.vim'
Plugin 'file://~/.vim/bundle/cctree'
"Plugin 'file://~/.vim/bundle/tabular' "similar to 'vim-easy-align'
"Plugin 'file://~/.vim/bundle/nerdtree'
Plugin 'file://~/.vim/bundle/manpageview'
Plugin 'file://~/.vim/bundle/grep'
Plugin 'tpope/vim-abolish.git' " https://github.com/tpope/vim-abolish
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'file://~/.vim/bundle/vim-ctrlspace'
"Plugin 'winmanager' " conflict with <cr> mapping
"Plugin 'TabBar'
Plugin 'csv.vim'
Plugin 'edkolev/promptline.vim'
Plugin 'Valloric/ListToggle'
Plugin 'luochen1990/rainbow'
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
Plugin 'QuickFixCurrentNumber'
Plugin 'ingo-library'
Plugin 'docunext/closetag.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'Raimondi/delimitMate'
Plugin 'junegunn/vim-easy-align'
Plugin 'Crapworks/python_fn.vim' "python code block motion/jumping
Plugin 'ap/vim-buftabline'
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

" change the mapleader from \ to ,
let mapleader=","

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
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

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

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" 设置过滤不进行查找的后缀名
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

set autoread

let g:load_doxygen_syntax=1

cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

nnoremap <Space> i<Space><Esc>

let g:airline_powerline_fonts = 1
set laststatus=2

let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

""http://vim.wikia.com/wiki/Using_tab_pages
""not working with multiple windows
"set switchbuf=usetab
"nnoremap <F8> :sbnext<CR>
"nnoremap <S-F8> :sbprevious<CR>

colorscheme molokai
"colorscheme visualstudio

" WARNING: enable ycm plugin FREEZE the editing everytime a conf
" file(~/.vimrc,
" ~/.vim/budle/YouCompleteMe/third_party/ycmd/cpp/.ycm_extra_conf.py) is
" OPENED!!
"Bundle 'Valloric/YouCompleteMe'
"let g:loaded_youcompleteme = 1 " disable ycm, conflict with acp plugin
"let g:ycm_show_diagnostics_ui = 0 " pep8 error is annoying!!
let g:ycm_auto_trigger = 1
" for ycm
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F4> :YcmDiags<CR>
inoremap <c-o> <c-x><c-o>
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


"function! g:UltiSnips_Complete()
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
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
