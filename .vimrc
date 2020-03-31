set nomodeline
set number
set noincsearch
set foldmethod=indent
augroup OpenAllFoldsOnFileOpen
    autocmd!
    autocmd BufRead * normal zR
augroup END


let mapleader=" "
let maplocalleader=" "

nnoremap <leader>sv :source $MYVIMRC<cr>
"Open .vimrc
nnoremap <leader>ee :e ~/.vimrc<cr>
"Open my notes
nnoremap <leader>en :e /home/khoa/Documents/notes/installationNotes/dailyNotes.md<cr>

"Switch to terminal mode
nnoremap <C-v> :vsplit<cr>:te<cr>
nnoremap <C-s> :split<cr>:te<cr>
set splitright "open file in right split

" paste from the last yank
noremap ,p "0p
noremap ,P "0P

" copy path of current file
map cp :let  @+ = expand("%:p")<cr>

"insert empty line
nnoremap <C-o> O<Esc>

"get out of terminal mode -> normal mode
tnoremap <esc> <C-\><C-n>

"Q to quit
nnoremap <silent> Q :q<cr>

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" truecolor for neovim
" if exists('+termguicolors')
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
" endif
if has('nvim') || has('termguicolors')
  set termguicolors
endif
"Buffer switching
"switch to previous buffer
nnoremap <C-p> <C-^>
"Cycle forward/backward between buffers
nnoremap <PageUp>   :bprevious<CR>
nnoremap <PageDown> :bnext<CR>
" search current visual selection
vnoremap z* "tyq/"tp<cr>N
" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv
" change cursor position in insert mode
inoremap <C-h> <left>
inoremap <C-l> <right>
" change cursor position in terminal mode
tnoremap <C-h> <left>
tnoremap <C-l> <right>
"split navigations
"https://github.com/christoomey/vim-tmux-navigator/issues/103
" nnoremap <C-j> <C-w><Down>
" nnoremap <C-k> <C-w><Up>
" nnoremap <C-l> <C-w><Right>
" nnoremap <C-h> <C-w><Left>
"move line up or down
nnoremap <leader>jj :m .+1<CR>==
nnoremap <leader>kk :m .-2<CR>==
inoremap <leader>jj <Esc>:m .+1<CR>==gi
inoremap <leader>kk <Esc>:m .-2<CR>==gi
vnoremap <leader>jj :m '>+1<CR>gv=gv
vnoremap <leader>kk :m '<-2<CR>gv=gv

"Replace all occurences of current word
nnoremap [s :%s/\<<C-r><C-w>\>/

"Tip: select multiple instance of current words and change them 
" cgnfoo<esc>

"No number terminal mode
au TermOpen * setlocal nonumber norelativenumber

"[Old]List all buffer and choose
" nnoremap <C-b> :ls<CR>:
"[need fzf] List all buffer and choose
nnoremap <C-b> :Buffers<CR>
"[need fzf] List all files in dir (recursively) 
nnoremap <C-f> :Files<CR>

" disable highlight until the next search
nnoremap <silent> <BS> :noh<CR>

set hidden "allow for hiding changed buffer .aka being able to switch buffer while current one's changes are not saved
set shortmess+=I "don't show intro message
set formatoptions+=j " Delete comment character when joining commented lines
set cinoptions+=(0 "align parameters when having line break in c code.
set expandtab "use space instead of tabs (because that seems to be the de facto standard)
set autoindent "auto indent the below line same as the above line
set smarttab "a <BS> will delete shiftwidth spaces, (1 space when off)
set tabstop=4 "tab visual length is 4 columns
set shiftwidth=4 "set indent width (when using =) to be equal to tabstop, do not set this =0 as indentation == will not work
" set laststatus=0 "always show status line
set ignorecase "search /\c by default, after / ? * #
set smartcase "if the queries have uppercase letter, use case sensitive search
set mouse=a "enable using the mouse
set cursorline "highlight the current line
set title "show title (in terminal, like in gui)
set splitright splitbelow "avoid moving code
set linebreak breakindent "wrap line in logical place rather than separating words. Start wrapped lines at the same indentation rather than starting from the beginning of the line
let &showbreak='↪ ' " start wrapped line by

"auto complete navigation (default is C-p C-n)
" inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

let s:cache_dir = '~/.vim/.cache'
function! s:get_cache_dir(suffix, exact_path)
    return resolve(expand(s:cache_dir . '/' . a:suffix)).(a:exact_path?'//':'')
endfunction

let &directory=s:get_cache_dir('swap',1) " means swap file will have full path as swap file name (otherwise, if there are multiple files with the same name opened, swap file name will be .swp, .swn, .swo....)

set viminfo+=n~/.vim/viminfo "specify the place of viminfo

function! EnsureExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path))
    endif
endfunction

call EnsureExists(s:cache_dir)
call EnsureExists(&directory)

"""""""""""""""""" BEGIN PLUGIN
call plug#begin('~/.vim/plugged')
"To install plugins: vim-plug: source vimrc and ':PlugInstall'
" open plugins' help with (help: pluginName)
"To uninstall: uncomment plugin, source .vimrc. Run :PlugClean

"*** [Plugin] ***
Plug 'tomtom/tcomment_vim' " nerdcommentter have no motion, 'tpope/vim-commentary' don't recognize comment without space. Use gc + motion

"*** [Plugin] ***
Plug 'terryma/vim-smooth-scroll'
" nnoremap <silent> <C-p> :call smooth_scroll#up(&scroll/2   ,20 ,1)<CR>
" nnoremap <silent> <C-n> :call smooth_scroll#down(&scroll/2 ,20 ,1)<CR>
nnoremap <silent> <C-u> :call smooth_scroll#up(&scroll     ,20 ,2)<CR>
nnoremap <silent> <C-d> :call smooth_scroll#down(&scroll   ,20 ,2)<CR>
" nnoremap <silent> <C-b> :call smooth_scroll#up(&scroll*2   ,20 ,2)<CR>
" nnoremap <silent> <C-f> :call smooth_scroll#down(&scroll*2 ,20 ,2)<CR>

" "*** [Plugin] ***
Plug 'oblitum/rainbow' "help you read complex code by showing diff level of parentheses in diff colo
" slow down in large file
" enable with :RainbowToggle
let g:rainbow_active = 0
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}

"*** [Plugin] ***
Plug 'Raimondi/delimitMate' "auto close brackets
" let delimitMate_expand_cr = 1 "{ [cursor] } works intuitively
let delimitMate_excluded_ft = "unite"
augroup delimitMate_settings
    "prevent the double quote auto match in vim filetype
    autocmd! FileType vim let b:delimitMate_quotes = "` '"
augroup END

"*** [Plugin] ***
Plug 'Chiel92/vim-autoformat' "autoformat container for all file types
noremap <F7> :Autoformat<CR>
"--max-instatement-indent=? --close-templates?
let s:autoformat_astyle_common_options='--style=java --indent-switches --indent-labels --indent-col1-comments --min-conditional-indent=0 --pad-oper --unpad-paren --pad-header --add-brackets --convert-tabs ".(&expandtab ? "--indent=spaces=".&shiftwidth : "--indent=tab")'
let g:formatdef_my_custom_java = '"astyle --mode=java '.s:autoformat_astyle_common_options
" let s:autoformat_astyle_c_options='--indent-modifiers --indent-namespaces --indent-preproc-block --indent-preproc-define --align-pointer=type '
" let g:formatdef_my_custom_c = '"astyle --mode=c '.s:autoformat_astyle_c_options.s:autoformat_astyle_common_options
" let g:formatdef_my_custom_cs= '"astyle --mode=cs --align-method-colon --pad-method-colon=after '.s:autoformat_astyle_c_options.s:autoformat_astyle_common_options
let g:formatters_java = ['my_custom_java']
" let g:formatters_cs = ['my_custom_cs']
" " note: clangformat only format a selection (range of lines)
" let g:formatters_c = ['clangformat', 'my_custom_c']
" let g:formatters_cpp = ['clangformat', 'my_custom_c']

" <leader>ll to compile
Plug 'LaTeX-Box-Team/LaTeX-Box'
let g:LatexBox_quickfix=2

" *** [Plugin] ***
" Plug 'Valloric/YouCompleteMe', { 'on': [], 'do': './install.py --clang-completer' }
" " --clang-completer flag is for C-family languages support
" " For more information about compliling with semantic support for other
" " languages, see https://valloric.github.io/YouCompleteMe/
" " For C-family languages support, read the notes OR the file ".ycm_extra_conf.py" OR "https://valloric.github.io/YouCompleteMe/#intro" (search `Provide the flags manually`)
" augroup LoadYCMInsertMode
"     autocmd!
"     autocmd InsertEnter * call plug#load('YouCompleteMe')
"                 \| call youcompleteme#Enable() | autocmd! LoadYCMInsertMode
" augroup END
" " let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" " let g:ycm_python_binary_path = 'python3'
" let g:ycm_autoclose_preview_window_after_completion = 1
" " let g:ycm_complete_in_comments = 0
" let g:ycm_key_list_select_completion=['<C-j>', '<Down>']
" let g:ycm_key_list_previous_completion=['<C-k>', '<Up>']
" " You can get the filetype of the current file in Vim with :set ft?.
" let g:ycm_filetype_blacklist = {
"       \ 'tagbar' : 1,
"       \ 'qf' : 1,
"       \ 'notes' : 1,
"       \ 'markdown' : 1,
"       \ 'unite' : 1,
"       \ 'text' : 1,
"       \ 'vimwiki' : 1,
"       \ 'pandoc' : 1,
"       \ 'infolog' : 1,
"       \ 'mail' : 1
"       \}
" " let g:ycm_add_preview_to_completeopt = 1
" " " enable/disable 0/1
" let g:loaded_youcompleteme = 0

" Plug 'vim-syntastic/syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
"
" let g:syntastic_mode_map = {
"     \ "mode": "active",
"     \ "passive_filetypes": ["tex"] }

" *** [Plugin] ***
Plug 'godlygeek/tabular' " :Tabularize /<pattern>
" align the cheat section
" use T mark for Temp
" nnoremap <silent> <Leader>ac mTG?CHEAT<CR>VG:Tabularize /<Bar><CR>:noh<CR>'T:delmarks T<CR>
" vnoremap <silent> <leader>a: :Tabularize /:<CR>
" vnoremap <silent> <leader>a= :Tabularize /=<CR>
" vnoremap <silent> <leader>a, :Tabularize /,/l0<CR>
" vnoremap <silent> <leader>a<Bar> :Tabularize /<Bar><CR>

"*** [Plugin] ***
Plug 'plasticboy/vim-markdown' "depends on tabular
let g:vim_markdown_folding_disabled=1

" augroup Markdown_settings
"     autocmd! FileType mkd.markdown call s:markdown_settings()
" augroup END
"
" function! s:markdown_settings()
"     setlocal formatoptions+=ro "auto add - * when start inserting a new line
"     setlocal shiftwidth=2 tabstop=2 "for nested list
"     if has("unix")
"         let s:uname = substitute(system("uname -s"), '\n', '', '')
"         if s:uname == "Darwin"
"             setlocal makeprg=open\ % "open markdown file by chrome to view
"         endif
"     endif
" endfunction

"*** [Plugin] ***
Plug 'Shougo/unite.vim'
let g:unite_data_directory=s:get_cache_dir('unite',0)
"
" if executable('ag')
"     let g:unite_source_grep_command='ag'
"     let g:unite_source_grep_recursive_opt=''
"     " let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C0'
"     let g:unite_source_grep_default_opts =
"                 \ '-i --vimgrep --hidden --ignore ' .
"                 \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
" endif
"
" " grep text in current directory
" "With auto preview => sometimes slow
" " nnoremap <silent> [s :<C-u>Unite -auto-resize -auto-preview -buffer-name=search grep:.<cr>
" "W/o auto preview
" nnoremap <silent> [s :<C-u>Unite -auto-resize -buffer-name=search grep:.<cr>
" "Grep current word
" " nnoremap <silent> [g :<C-u>Unite -auto-resize -buffer-name=search grep:.<cr><C-r><C-w><cr>
" "Grep in a specific folder, the command may not appear, just continue typing after typing keyboard shortcut
" nnoremap <silent> [f :<C-u>Unite -auto-resize -buffer-name=search grep:
" " registers content
" nnoremap <silent> [r :<C-u>Unite -auto-resize -buffer-name=registers register<cr>
" " find usages of a word
" nnoremap <silent> <F2> :<C-u>Unite -auto-resize -no-quit -buffer-name=search grep:.<cr><C-r><C-w><cr>
" vnoremap <silent> <F2> "ty:<C-u>Unite -auto-resize -no-quit -buffer-name=search grep:.<cr><C-r>t<cr>
" " search all mappings
" nnoremap <silent> [m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
" " reopen last unite buffer
" nnoremap <silent> [u :<C-u>UniteResume<CR>

"*** [Plugin] ***
Plug 'Shougo/vimfiler.vim'
nnoremap <silent> <F1> :VimFilerCurrentDir -status -split -simple -winwidth=40 -toggle -no-quit <cr>
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_leaf_icon=''
let g:vimfiler_tree_closed_icon='▸'
let g:vimfiler_tree_opened_icon='▾'
let g:vimfiler_expand_jump_to_first_child=0
highlight def link vimfilerOpenedFile Identifier
highlight def link vimfilerClosedFile Identifier
nmap <buffer> <2-LeftMouse> <Plug>(vimfiler_edit_file)
autocmd FileType vimfiler nmap <silent><buffer> <2-LeftMouse> <Plug>(vimfiler_expand_or_edit)

"Open file in split
autocmd FileType vimfiler nnoremap <silent><buffer><expr> s vimfiler#do_switch_action('vsplit')
" Switch from vimfiler window to file
autocmd FileType vimfiler nmap <silent><buffer> <C-l> <Plug>(vimfiler_switch_to_other_window)
autocmd FileType vimfiler nmap <silent><buffer> <C-j> <Plug>(vimfiler_switch_to_other_window)
"
let g:vimfiler_ignore_pattern = ['^\.','\.pyc$', '\.png$','\.class$','\.swp','\.swn','\.swo','\.tar.gz','\.arm']


"*** [Plugin] ***
Plug 'ap/vim-css-color' "css color highlight

"*** [Plugin] ***
" Plug 'justinmk/vim-syntax-extra' "highlight pointer, brackets...

"*** [Plugin] ***
" Plug 'klen/python-mode' "python environment
" let g:pymode_folding = 0
" let g:pymode_lint_on_write = 0
" let g:pymode_rope = 0
" let g:pymode_options = 0

"*** [Plugin] ***
Plug 'tpope/vim-fugitive' "git interface
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gv :Gvdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gp :Gpush<CR>

"*** [Plugin] ***
Plug 'gregsexton/gitv' "git log viewer
nnoremap <silent> <leader>gl :Gitv!<CR>
let g:Gitv_DoNotMapCtrlKey = 0

"*** [Plugin] ***
Plug 'airblade/vim-gitgutter' "jump between hunks: [] c; stage:<leader>hs; revert <leader>hr; prevew <leader>hp
set updatetime=100 "git gutter depends on this option
let g:gitgutter_max_signs = 1000 "default 500, not work well with large files
nmap [c <Plug>GitGutterPrevHunkzz
nmap ]c <Plug>GitGutterNextHunkzz

"*** [Plugin] ***
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

"*** [Plugin] ***
Plug 'tpope/vim-eunuch' " :Delete :Unlink :Move :Rename :Chmod :Mkdir :Cfind :Clocate :Lfind/:Llocate :Wall :SudoWrite :SudoEdit

"*** [Plugin] ***
Plug 'Shougo/vimproc.vim', {'do' : 'make'} "dependency for file_rec/async or file_rec/git

"*** [Plugin] ***
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1

"*** [Plugin] ***
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" search  
nnoremap <leader>s :Ag 
" search current word under the cursor
nnoremap <silent> <leader>ag :Ag <C-R><C-W><CR>

"*** [Plugin] ***
Plug 'google/vim-searchindex'
"
"*** [Plugin] ***
Plug 'christoomey/vim-tmux-navigator'

"*** [Plugin] ***
Plug 'will133/vim-dirdiff'

"*** [Plugin] ***
Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme='powerlineish'
" let g:airline_theme='deus'
" let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'   " for solarized dark: select 'solarized' then uncomment this
"path to themes: .vim/plugged/vim-airline/autoload/airline/themes/

"*** [Plugin] ***
Plug 'morhetz/gruvbox'

"*** [Plugin] ***
Plug 'dracula/vim', { 'as': 'dracula' }
"
"*** [Plugin] ***
Plug 'crusoexia/vim-monokai'

" *** [Plugin] ***
Plug 'lifepillar/vim-solarized8'
"
"*** [Plugin] ***
Plug 'chriskempson/base16-vim'
"
" "*** [Plugin] ***
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

call plug#end()

" turn off vim filer safe mode by default
call vimfiler#custom#profile('default', 'context', {
            \   'safe' : 0
            \ })

" Choose color scheme here
" set background=light " for solarized dark
colorscheme  challenger_deep
" colorscheme base16-google-light
" colorscheme base16-google-dark
" colorscheme solarized8_high
" let g:gruvbox_contrast_light='medium'    " soft/medium/hard
" colorscheme gruvbox

highlight Comment cterm=italic gui=italic

highlight SvnGutterAdd guifg=red guibg=red
" transparent (put after colorscheme)
" hi Normal guibg=NONE ctermbg=NONE 

" air-line
let g:airline_powerline_fonts = 1
" enable/disable detection of whitespace errors
" let g:airline#extensions#whitespace#enabled = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

if has('nvim')
  " set winblend=20
  function! s:create_float(hl, opts)
    let buf = nvim_create_buf(v:false, v:true)
    let opts = extend({'relative': 'editor', 'style': 'minimal'}, a:opts)
    let win = nvim_open_win(buf, v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:'.a:hl)
    call setwinvar(win, '&colorcolumn', '')
    return buf
  endfunction

  function! FloatingFZF()
    " Size and position
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
    let row = float2nr((&lines - height) / 2)
    let col = float2nr((&columns - width) / 2)

    " Border
    let top = '╭' . repeat('─', width - 2) . '╮'
    let mid = '│' . repeat(' ', width - 2) . '│'
    let bot = '╰' . repeat('─', width - 2) . '╯'
    let border = [top] + repeat([mid], height - 2) + [bot]

    " Draw frame
    let s:frame = s:create_float('Comment', {'row': row, 'col': col, 'width': width, 'height': height})
    call nvim_buf_set_lines(s:frame, 0, -1, v:true, border)

    " Draw viewport
    call s:create_float('Normal', {'row': row + 1, 'col': col + 2, 'width': width - 4, 'height': height - 2})
    autocmd BufWipeout <buffer> execute 'bwipeout' s:frame
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif
"
" CHEAT
" Key binding                                       | Meaning
"-------------------------------------------------- | ---------------------------------------
":sp filename                                       | horizontal split
":vsp filename or :vs filename                      | vertical split
" , ;                                               | repeat the last f F t T
" .                                                 | repeat the last editing command
" - Enter                                           | go to beginning of previous (next) line
" C-c                                               | back to normal mode from insert mode
" q<char>, something, q; -> @<char> ; @@            | macro recorded; then play the macro; then replay the last macro
" %                                                 | go to matching brackets
" $%                                                | go to the closing braces, at the beginning of for loop
" b e w ge                                          | recommended way to move horizontally
" w W                                               | next word, next big word (big word are only separated by white spaces)
" zt zz zb                                          | position window such that cursor at top, middle, bottom of screen
" H M L                                             | position cursor inside window at head, middle last of screen
" '.                                                | jump back to last edited line
" `.                                                | jump to the last edited position
" gi                                                | jump to the last edited position and switch to insert
" g; g,                                             | cycle to the previous / next edited position.
" `[ `]                                             | beginning/ ending char of changed or yanked text
" '[ ']                                             | beginning/ ending line of changed or yanked text
" `` ''                                             | jump to previous position / line (work after executing a jump)
" R                                                 | replace text
" ^ _                                               | go to the first non-whitespace in line (the latter supports count)
" ()                                                | beginning of previous, next sentence (separated by dot)
" {}                                                | beginning of prev, next paragraph (separated by blank lines)
" vaw viw                                           | select word with (without) trailing spaces
" viwp                                              | replace word with yanked text
" viw"0p                                            | replace word with first yanked text
" w s p t                                           | word, sentence, paragraph, tag
" vib                                               | select inner block
" viB equivalent vi{                                | select curly block
" <C-a>  <C-x>                                      | increase, decrease number
" <C-x><C-D>                                        | complete predifined C preprocessor (ít dùng)
" zo zc                                             | open close fold
" do dp                                             | [DIFF] take diff from, put diff to other window
" :diffu                                            | [DIFF] update change inside line
" << >>  / < >  / <C-d> <C-t>                       | [NORMAL] [VISUAL] [INSERT] indent, unindent
" ~ u U                                             | [VISUAL] toggle uppercase - lowercase
" :123 123G 123gg                                   | [COMMAND] [NORMAL] go to line 123
" C-f C-b C-d C-u C-e C-y                           | scroll up down
" m<char> '<char> `<char>                           | set mark, go to beginning of mark line, go to mark
" * # g* g#                                         | find current word forward/backwards; whole word/not whole word
" :127,215 s/foo/bar                                | [COMMAND] change the first occurrence of 'foo' into 'bar' on each line between 127 and 215
" :3,/sometext/ .....                               | [COMMAND] change apply from line 3 to the occurence of sometext
" :.,/sometext/+1 ....                              | [COMMAND] change apply from current line to the line after the line containing sometext
" :range s/foo/bar/g :range s/foo/bar/gc            | [COMMAND] replace foo with bar globally/ globally and ask for each occurence
" . , $                                             | [COMMAND] represent current and last lines respectively
" :.,$j                                             | [COMMAND] from the current line to the last line, join them all into one line
" :%                                                | [COMMAND] same as :1,$ (all the lines)
" :linerange g/pattern/... :linerange v/pattern/... | [COMMAND] apply to lines which match/ not match a pattern
" :... d p m j s                                    | [COMMAND] delete, print, move , join, substitute
" :.,+21g/foo/d                                     | [COMMAND] delete any lines containing the string 'foo' from the current one through the next 21 lines"
" :.,$v/bar/d                                       | [COMMAND] from here to the end of the file, delete any lines which DON'T contain the string 'bar'
" :g/re/p                                           | [COMMAND] globally print lines containing a regular expression (re) (this is grep)
" :% g/foo/m$                                       | [COMMAND] all the 'foo' lines will have been moved to the end of the file. (Note the other tip about using the end of your file as a scratch space). This will have preserved the relative order of all the 'foo' lines while having extracted them from the rest of the lis
" :% g/foo/s/bar/zzz/g                              | [COMMAND] for every line containing 'foo' substitute all 'bar' with 'zzz'
" :'a,'bg/foo/j                                     | [COMMAND] join any line containing the string foo to its subsequent line, if it lies between the lines between the 'a' and 'b' marks.
" :r filename                                       | [COMMAND] inserts the contents of the file named 'filename' at the current line
" ma, move to the other end, y`a or d`a             | copy or cut an arbitrary selection of text
" "add "ap                                          | cut the line into 'a' register and paste from that register
" y/foo                                             | copy text from here too the next occurence of foo
" /\cfoo or /foo\c                                  | match foo, Foo, fOO, FOO, etc
" /\Cfoo or /foo\C                                  | only match foo.
" 3J                                                | join the next 3 lines
" d2}                                               | delete from here to the end of the 2nd paragraph from here
" :! ls ~/Desktop/                                  | [COMMAND] execute command (list all files on the desktop)
" :! subl %                                         | [COMMAND] open the current file by sublime text
" 1G!Gsort equivalent :1,$!sort                     | [COMMAND] execute the external sort command on all the lines of this file
" :r! ls ~/Desktop/                                 | [COMMAND] print the results of this command to the text
" :so ~/.vimrc equivalent :source ~/.vimrc          | [COMMAND] execute all lines of this file (called by default at the beginning)
" <C-r> +                                           | [INSERT] [COMMAND] print those things
"                                                   | a - z the named registers
"                                                   | " the unnamed register, containing the last delete or yank
"                                                   | 0 the yank register
"                                                   | 1-9 the delete register (>= a line)
"                                                   | - the small delete register (less than a line)
"                                                   | % the current file name
"                                                   | # the alternate file name
"                                                   | * the clipboard contents (X11: primary selection)
"                                                   | + the clipboard contents
"                                                   | / the last search pattern
"                                                   | : the last command-line
"                                                   | . the last inserted text
"                                                   | =5*5 insert 25 into text (mini-calculator)
" %s/foo(/foo( wibble,/                             | [COMMAND] add wibble parameter to function foo
" :normal dd                                        | [COMMAND] execute the following text as if it was typed in in normal mode, here we delete line
" q: equivalent :<C-f> q/                           | command, search history and a place to use mode
" <C-x> <C-u> / <C-n> <C-p>                         | [NORMAL] [INSERT] completion (chưa thử)
" <C-w> = > < + -                                   | change window size
" <C-w> <C-o>                                       | make this window the only window
" <C-u>                                             | [INSERT] delete to beginning of line
" :% g/foo/m$                                       | [COMMAND] move all the 'foo' lines to the end of the file
" :verbose set tw? wm?                              | find out where 'textwidth' and 'wrapmargin' were set last
" 23:                                               | [COMMAND] enter line range: from current line to the next 23 lines
" C-] C-O                                           | Jump to tags; jump back to anything
" <C-g> g<C-g>                                      | print current column, line, bytes, %, word count... information
" <S-pageUp/Down>                                   | move up/down after seeing the output of an external program (e.g. make, fugitive log, etc)
" <count>@:                                         | [COMMAND] execute last ex command
" gx                                                | open url
