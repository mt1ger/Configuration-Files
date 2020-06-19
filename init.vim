" Configuration file for vim
" Save this as ~/.vimrc

"**************************************** VUNDLE CONFIGURATION ****************************************"
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle plugin: A plugin manager
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'

" Plugins: File managers
Plugin 'scrooloose/nerdtree' | Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'

" Syntastic plugin: A syntax checker
Plugin 'scrooloose/syntastic' 

" Plugins: Efficent way to write code 
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-scripts/tComment' 
Plugin 'tpope/vim-surround'

Plugin 'vim-airline/vim-airline'

" Sparkup plugin: Efficient way to write HTML code
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Fugitive plugin: Git wrapper
Plugin 'tpope/vim-fugitive'
Plugin 'sjl/vitality.vim'
Plugin 'vim-latex/vim-latex'
" Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'nvie/vim-flake8'
Plugin 'idanarye/vim-vebugger'
Plugin 'Shougo/vimproc.vim'
Plugin 'tpope/vim-repeat'

" Background
Plugin 'morhetz/gruvbox'
"========= All of your Plugins must be added before this line ========="
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

"========= All of Non-Plugins must be added after this line ========="
Bundle 'Valloric/YouCompleteMe' 
"**************************************** END OF VUNDLE CONFIGURATION ****************************************"


"**************************************** NORMAL CONFIGURATION OF VIM ****************************************" 

" set lines=36 columns=78				" Set up the open up window size of vim

set modelines=0		                " CVE-2007-2438
set nocompatible	             	" Use Vim defaults instead of 100% vi compatibility
set backspace=2						" more powerful backspacing
" set expandtab
set tabstop=4           			" Tab键的宽度
set nu                  			" 显示行号
syntax on               			" 语法高亮
syntax enable       				" 语法开启
set smartindent						" 智能缩进
set autoindent						" 自动缩进
autocmd InsertLeave * se nocul		" 用浅色高亮当前行
autocmd InsertEnter * se cul		" 用浅色高亮当前行
set hlsearch            			" highlight searched pattern
set showcmd         				" 显示命令
set ruler  
" set spell spelllang=en_us         " enable spelling checking
set smartcase      					" is one piece with ignorecase
set ignorecase     					" is one piece with smartcase 
set ts=4 sw=4						" 设置shift宽度为tap宽度
" About folding
set foldmethod=manual

augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

set number relativenumber			" Turn on relative line number on Normal Mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set nu rnu                          " Turn on actually line number under cursor

"++++++++++++ For Solarized ++++++++++++++"
" set termguicolors
if has("termguicolors")
	" Fix bug for using Vim under Tmux
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	" Enable true color
	set termguicolors
endif
set background=dark
colorscheme gruvbox " 设置背景为gruvbox

"Display Indent Guides
set list listchars=tab:\¦\ 
set nocursorline

"++++++++++++ Abreviations +++++++++++++++"
ab #d #define 
ab #i #include
ab nt NERDTreeToggle
ab mdpre MarkdownPreview

"+++++++++++++ Key Binding +++++++++++++++"
"Global
inoremap (( ()<Esc>i
inoremap [[ []<Esc>i
inoremap "" ""<Esc>i
inoremap '' ''<Esc>i
" inoremap {{ <Esc>o{<Esc>o}<Esc>O<Tab>
inoremap {{ {<Esc>o}<Esc>O<Tab>
inoremap }} {}<Esc>i
			

"For Vim Split Operations
map U <c-r>

"For Tcomment 
map gu g<
map <leader>c <c-_>

"*** For Tmux ***
" Cross-session copy, use <Cmd>v to paste
map <c-y> "+y  

"For vimdiff
autocmd FilterWritePre * if &diff | setlocal wrap< | endif "for wrapping lines
"**************************************** END OF VIM NORMAL CONFIGURATION ****************************************"


"**************************************** CONFIGURATION FOR YOUCOMPLETEME ****************************************"
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = '/Users/mt1ger/.vim/bundle/YouCompleteMe/cpp/.ycm_extra_conf.py'
"**************************************** END OF YOUCOMPLETEME CONFIGURATION **************************************


"**************************************** CONFIGURATION FOR MARKDOWN PREVIEWS ****************************************"
let g:mkdp_browser = 'chrome'
"**************************************** END OF MARKDOWN PREVIEWS CONFIGURATION **************************************


" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup



"**************************************** CONFIGURATION OF AIRLINE (POWERLINE) ****************************************" 
"*** Only Work for Powerline ***
" Setup the environment for powerline
" set rtp+=/Users/mt1ger/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim

" let g:minBufExplForceSyntaxEnable = 1


"*** Work for Both Airline and Powerline ***
" These lines setup the environment to show graphics and colors correctly.
set nocompatible
set t_Co=256
 
" if ! has('gui_running')
   set ttimeoutlen=0
"    augroup FastEscape
"       autocmd!
"       au InsertEnter * set timeoutlen=0
"       au InsertLeave * set timeoutlen=1000
"    augroup END
" endif
set laststatus=2 " Always display the statusline in all windows
set guifont=Courier:h16
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"*** Only work for Air ***
" If use powerline fonts (1) or not (0)
let g:airline_powerline_fonts = 1
" If detect white space (1) or not (0)
let g:airline#extensions#whitespace#enabled = 0
" Setup the section layout
let g:airline#extensions#default#layout = [
  \ [ 'a', 'b', 'c' ],
  \ [ 'x', 'y', 'z', 'error', 'warning' ]
  \ ]
" Configuration to show absolute path (%F) or file name (%f). 
let g:airline_section_c = '%f'
" call airline#parts#define_raw('linenr', '%l')
" let g:airline_section_z = airline#section#create(['%3p%%', g:airline_symbols.maxlinenr, 'linenr', ':%c'])
let g:airline_section_z = airline#section#create(['%3p%%', g:airline_symbols.maxlinenr,' %l:%c'])
let airline#extensions#default#section_use_groupitems = 0
let g:airline_symbols.dirty=' *'



"**************************************** END OF POWERLINE CONFIGURATION ****************************************" 


"**************************************** SYNTASTIC CONFIGURATION ****************************************"
let g:syntastic_mode_map = {
     \ "mode": "active",
     \ "passive_filetypes": ["tex"]}

"*** Airline Syntastic Configuration ***
" enable/disable syntastic integration 
  let g:airline#extensions#syntastic#enabled = 1
" syntastic error_symbol 
  let airline#extensions#syntastic#error_symbol = 'Err#:'
" syntastic statusline error format (see |syntastic_stl_format|) 
  let airline#extensions#syntastic#stl_format_err = '%E{ %e}'
" syntastic warning 
  let airline#extensions#syntastic#warning_symbol = 'Warn#:'
" syntastic statusline warning format (see |syntastic_stl_format|) 
  let airline#extensions#syntastic#stl_format_warn = '%W{ %w}'

let g:syntastic_always_populate_loc_list = 1  
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_error_symbol = "✗"
let syntastic_style_error_symbol = "✗"
let g:syntastic_warning_symbol = "∙∙"
let syntastic_style_warning_symbol = "∙∙"

"For c family
let g:syntastic_c_checkers = ['gcc']
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++'

"For python3
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_post_args = ['--ignore=F403, F405, E501, E266, E211']

"For Latex
let g:syntastic_tex_checker = ['lachech']

"To enable lnext (locate the next error/warning)
ab ln lnext 
"To enable lprevious (locate the previous error/warning)
ab lp lprevious
"To enable lopen (open Syntastic window)
ab lo lopen
"To enable lclose (close Syntastic window)
ab lc lclose
"**************************************** END OF SYNTASTIC CONFIGURATION ****************************************"


"**************************************** FUGITIVE CONFIGURATION ****************************************" 
set diffopt+=vertical

ab dg diffget
ab dp diffput
ab du diffupdate
ab Gst Gstatus
ab Gct Gcommit
ab Gw Gwrite
ab Gr Gread
ab Grm Gremove
ab Gmv Gmove
"**************************************** END FUGITIVE CONFIGURATION ****************************************" 


"**************************************** LATEX SUITE CONFIGURATION ****************************************" 
let g:tex_flavor='latex'    "Let Latex suite recognize .tex 
let g:Tex_CompileRule_pdf = 'mkdir -p build && pdflatex -synctex=1 -output-directory=build -interaction=nonstopmode $* && cp *.bib build && cd build && bibtex %:r && cd .. && pdflatex -synctex=1 -output-directory=build -interaction=nonstopmode $* && mv build/$*.pdf .'    "Let latex suite compile .tex and .bib file
let g:Tex_TreatMacViewerAsUNIX = 1

autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a PDF\ expert'
let g:Tex_ViewRule_pdf = 'open -a skim'
let g:Tex_MultipleCompileFormats = 'dvi, pdf'
" map ,ls :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR><CR>
nmap <f8> :LLPStartPreview<return>
"**************************************** END LATEX SUITE ****************************************"


"**************************************** AMPL CONFIGURATION ****************************************"
au BufRead,BufNewFile *.mod set filetype=ampl 
"**************************************** END AMPL ****************************************"

ab VG VBGstartGDB 
let g:vebugger_leader='<Leader>g' " Vebugger
