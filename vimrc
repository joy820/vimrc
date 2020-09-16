" general
set nocompatible  " Use Vim Settings (Not Vi)
syntax on  " highlight syntax (I think by default is on?)
set encoding=utf8
" leader key
let mapleader=" "

" Plugins:
" install vim-plug if needed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
          \  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Put plugs here
call plug#begin('~/.vim/plugged')

" UI and Basic:
" Plug 'flazz/vim-colorschemes'  " install color schemes
" Plug 'blueyed/vim-diminactive'  " dim inactive pane
Plug 'Yggdroot/indentLine'  " show indent line
Plug 'arcticicestudio/nord-vim'  " nord colorscheme
Plug 'vim-airline/vim-airline'  " vim status bar
" Plug 'vim-airline/vim-airline-themes'  " vim airline theme
" Plug 'ryanoasis/vim-devicons'
" NOTE fzf vim requires manually install fzf from git and ripgrep,
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'rakr/vim-two-firewatch'


" Editing Tools:
Plug 'rhysd/accelerated-jk'  " accelerate hjkl move
Plug 'tpope/vim-commentary'  " comment, using gc
Plug 'tpope/vim-fugitive'  " for vim git

" Window Tools:
Plug 'christoomey/vim-tmux-navigator'  " seamlessly navigate pane under vim and tmux
Plug 'scrooloose/nerdtree'
Plug 'camspiers/animate.vim'  " animation of window resize

" Programming:

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }  " deoplete auto complete plug, needs to install autocomplete source for different language though, e.g. jedi for python
" Plug 'zchee/deoplete-jedi'  " autocomplete source for python
Plug 'lervag/vimtex', {'for': 'tex'}  " LaTeX compiler
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wakatime/vim-wakatime'

call plug#end()

" color for vim
" let g:solarized_termtrans = 1  " this must be use together when setting terminal to solarized
" let g:solarized_termcolors=16  " this must be use together when setting terminal to solarized 
" set background=dark
" colorscheme solarized
" augroup nord-overrides
"   autocmd!
"   autocmd ColorScheme nord highlight Comment ctermfg=1
" augroup END
set termguicolors

" NORD colorscheme
colorscheme nord
" TODO need to add a if for nord
" only use gui not cterm
" red for comments
hi Comment guifg=#BF616A
" active and inactive window
hi ActiveWindow guibg=#2E3440
hi InactiveWindow guibg=#3D434F
hi VertSplit guifg=#ebcb8b guibg=#3D434F
set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow


" " TWO-FIREWATCH colorscheme
" colorscheme two-firewatch
" set background=dark " or light if you prefer the light version
" let g:two_firewatch_italics=1
" let g:airline_theme='twofirewatch' " if you have Airline installed and want the associated theme


" " Call method on window enter
" augroup WindowManagement
"   autocmd!
"   autocmd WinEnter * call Handle_Win_Enter()
" augroup END

" " Change highlight group of active/inactive windows
" function! Handle_Win_Enter()
"   setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
" endfunction

" air-line
" let w:airline_disabled=1
let g:airline_powerline_fonts = 0
let g:airline_left_sep=''  " ue0b8
let g:airline_right_sep=''  " ue0ba


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#tabs_label = 'TABS'       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)

let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)      
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline                                            
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline               
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right                                                           
let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline, only show tab
let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline                                  
let g:airline#extensions#tabline#show_tab_nr = 1       " enable tab numbers                                                              
let g:airline#extensions#tabline#tab_nr_type = 1       " show tab number rather than number of split
let g:airline#extensions#tabline#buffer_idx_mode = 1   " use <leader> + number to switch between tabs
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" nmap <leader>- <Plug>AirlineSelectPrevTab
" nmap <leader>= <Plug>AirlineSelectNextTab

let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" ignore some files in the folder
" this may affect expand(), glob(), globpath() etc
set wildignore+=*.pyc

" set floating window transparency
set winblend=15
" open a floating window to create a buff which can be used for plugin
" see https://github.com/camspiers/dotfiles/blob/master/files/.config/nvim/init.vim#L445-L522
" for more details
function! CreateCenteredFloatingWindow()
    let width = float2nr(&columns * 0.8)
    let height = float2nr(&lines * 0.8)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height-2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    autocmd BufWipeout <buffer> call CleanupBuffer(s:buf)
    tnoremap <buffer> <silent> <Esc> <C-\><C-n><CR>:call DeleteUnlistedBuffers()<CR>
endfunction

function! CleanupBuffer(buf)
    if bufexists(a:buf)
        silent execute 'bwipeout! '.a:buf
    endif
endfunction

function! DeleteUnlistedBuffers()
    for n in nvim_list_bufs()
        if ! buflisted(n)
            let name = bufname(n)
            if name == '[Scratch]' ||
              \ matchend(name, ":bash") ||
              \ matchend(name, ":lazygit") ||
              \ matchend(name, ":tmuxinator-fzf-start.sh") ||
              \ matchend(name, ":hstarti")
                call CleanupBuffer(n)
            endif
        endif
    endfor
endfunction


" Coc settings                                                                                                                                                                                                                                  
set signcolumn=number
set updatetime=100
set shortmess+=c
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if

let g:coc_global_extensions = [
      \'coc-python',
      \'coc-html',
      \'coc-css',
      \'coc-vimlsp',
      \'coc-yaml',
      \'coc-json',
      \'coc-marketplace',
      \'coc-explorer',
      \'coc-yank',
      \'coc-highlight']
nnoremap <leader>cl :CocList marketplace<CR>

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `<leader>-` and `<leader>=` to navigate diagnostics
nmap <silent> <leader>- <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>= <Plug>(coc-diagnostic-next)

" goto keybindings
" Go to definition
nmap gd <Plug>(coc-definition)
" Go to type definition
nmap <silent> gy <Plug>(coc-type-definition)
" Go to implementation
nmap <silent> gi <Plug>(coc-implementation)
" Go to references
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Coc-explorer
nnoremap <leader>t :CocCommand explorer<CR>
hi HighlightedyankRegion term=bold guifg=#BF616A guibg=#ebcb8b

" Indent line, disable some file type
let g:indentLine_fileTypeExclude = ['text', 'sh', 'tex', 'coc-explorer', 'startify']

set modelines=0  " there is a security issue, so set to 0
set ignorecase
set smartcase  " ignore(smart) case when doing find
set hlsearch  " highlight search result
set incsearch  " show result simultaneously with search
set wildmenu  " command-line completion at the bottom??
set scroll=10  " ctrl U/D lines
set scrolljump=1  " display 5 new lines when cursor touch top/bottom
set scrolloff=5  " minimum lines to keep at top/bottom
set sidescroll=1 " side scroll
set sidescrolloff=4
set splitright splitbelow  " for vs and sp

set textwidth=100  " set max text width in a line. Later will modify the textwidth for different filetype in different init function
set autoindent smartindent  " smartly indent (requires autoindent on)
set smarttab  " tab in front of a line will use shiftwidth, otherwise always use tabstop
set expandtab  " expand tab into space
set tabstop=2  " tab length of column
set softtabstop=2  " number of column for spaces not long enough for a tab (if expandtab, this is useless)
set shiftwidth=2  " indent (>) length of column
set backspace=indent,eol,start  " can backspace across lines
set nowrap  " do not wrap long lines. Instead will show out of the screen.
set whichwrap=b,s,<,>,[,] " allow backspace, space, cursor to move across different lines

" set spell spelllang=en_us " spell check on/off, otherwise `set nospell`
set nospell

set number  " show absolute line number on the left
set relativenumber  " show relative number on other line
set numberwidth=1

set cursorline  " highlight line of cursor
set nocursorcolumn  " no highlight column of cursor
set mouse=""  " disallow mouse

" Jump to the last known position when reopening a file.
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

"map shortcut
"paste in insert mode
inoremap <C-r><C-r> <C-r>0
" tab or untab in the very beginning
nnoremap <Tab> V>
nnoremap <S-Tab> V<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
"shortcut for vim cmd
inoremap jj <Esc>
inoremap jk <Esc>
nnoremap ; :
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
" move zv is for unfolding some lines
nnoremap n nzzzv
nnoremap N Nzzzv
" move word
nnoremap e w
" search
nnoremap # *N
nnoremap * #
nnoremap <C-n> :noh<CR>
"window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Remap arrows to resize
nnoremap <silent> <Up>    :call animate#window_delta_height(10)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(-10)<CR>
nnoremap <silent> <Left>  :call animate#window_delta_width(15)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(-15)<CR>
" nnoremap <Right> 4<C-w>>
" nnoremap <Left> 4<C-w><
" nnoremap <Down> 4<C-w>-
" nnoremap <Up> 4<C-w>+
"insert and cmd move
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cmap <C-j> <Down>
cmap <C-k> <Up>
" Auto pair
func! AutoPair(open, close)
    let line = getline('.')
    if col('.') > strlen(line) || index([' ', ']', ')', '}'], line[col('.') - 1]) > 0
        return a:open . a:close . "\<ESC>i"
    else
        return a:open
    endif
endfunc
func! ClosePair(char)
    return (getline('.')[col('.') - 1] == a:char ? "\<Right>" : a:char)
endfunc
inoremap <expr> ( AutoPair('(', ')')
inoremap <expr> ) ClosePair(')')
inoremap <expr> [ AutoPair('[', ']')
inoremap <expr> ] ClosePair(']')
inoremap <expr> { AutoPair('{', '}')
inoremap <expr> } ClosePair('}')


" " disable python3 support because current AV only support python2
" let g:python_host_prog = '/av/bin/python'
" let g:loaded_python3_provide = 0



" Cursor Movment
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
let g:accelerated_jk_acceleration_limit = 500
let g:accelerated_jk_acceleration_table = [10, 20, 30, 35, 40, 45, 50]

" LaTeX default settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
" let g:vimtex_view_method='mupdf'
" let g:vimtex_quickfix_mode=0
set conceallevel=0
" let g:tex_conceal='abdmg'
let g:tex_conceal=''


func! Python_init()
    set textwidth=120  " set max text width in a line. Later will modify the textwidth for different filetype in different init function
    set expandtab  " expand tab into space
    set tabstop=4  " tab length of column
    set softtabstop=4  " number of column for spaces not long enough for a tab (if expandtab, this is useless)
    set shiftwidth=4  " indent (>) length of column
    iabbr pdb import ipdb; ipdb.set_trace()
    " nmap <buffer> <F8> :call Flake8()<CR>
endfunc


func! Latex_init()
    set textwidth=150 " set max text width in a line. Later will modify the textwidth for different filetype in different init function
    set expandtab  " expand tab into space
    set tabstop=2  " tab length of column
    set softtabstop=2  " number of column for spaces not long enough for a tab (if expandtab, this is useless)
    set shiftwidth=2  " indent (>) length of column
endfunc

au FileType python :call Python_init()
au FileType tex :call Latex_init()


" spell check
augroup markdownSpell
    autocmd!
    autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
    autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_us
    autocmd BufRead,BufNewFile *.html setlocal spell spelllang=en_us
augroup END
" fast correct spelling
inoremap <C-q> <c-g>u<Esc>[s1z=`]a<c-g>u

" TODO
" add fold plugin

" startify
" let g:startify_padding_left = 30
let g:startify_padding_left = &columns / 4
let s:header = [
      \ '                      .......                                                     ',
      \ '                ,:;=*CYI/+++\IL=+,                                                ',
      \ '            .;&AZOYJI**+<;:-,,-:+=+L;                                             ',
      \ '          ,ARKOPJ**<---,,,...,,--:\>+IL\,                                         ',
      \ '        ,6EHRZFJ*</---,,,.....,,--:;\>*IO\,                                       ',
      \ '       ,AEHRZOVI+<<--,,,..........,,--;=*IL\                                      ',
      \ '      .BEEHK&I+/--,,,...............,,-:\;*I                                      ',
      \ '     .EEHDSZTJ*<\-,,,................,,-:>=+L:                                    ',
      \ '     :EEEBDOJ*=<;:+-,,....,,..........,,-;/I1I                                    ',
      \ '     :ZREWXRSCI*=<<;::;::,.-:/>.;;::--,.//KFT;                                    ',
      \ '     .XCHWEK*;:--6-\:,.:;:,//;.,;=,,,,..,IRF&|                                    ',
      \ '     `HWNBC/NMMMMMMNBC+=<<;-,-JHMMNMWRA;,.HFT.                                    ',
      \ '      XNMH/JMMMMMMMMMEHAJI*=:IMMMMMMMMMMB*YYT,                                    ',
      \ '      EMZS\9WNMNMMMWBWEPI<.I.EBWNMMMMMMMN;.:L                                     ',
      \ '      CNDNE\HBEBEEBR/HEPT&I;:`YI&SEBWNNWB:.:T                                     ',
      \ '       EBWHI*/;TRJJTBDMMXKMMEI-;*JZLZJI*=--;.                                     ',
      \ '       `THCL,.\<:;AENCMMAGNMHI-*F;\IJDHSI/IJ                                      ',
      \ '         :ENWM6+*JKHEF:*TYT*I-;-\L\A6NHGTJI                                       ',
      \ '          =AHWMWYDRKY1:+:YI-I-I\,1,\WMMWIY                                        ',
      \ '           XFBNDRLIB1HLB.W1.LL,I\I,JWH/IJ    +----------------------------------+ ',
      \ '           OA6BHZLIY;HTF=H=JIJII\-1JZV:JI    |                                  | ',
      \ '           ZSH&BEKLH0E1IIY-I/:1IJ=*J:/TIJ    | Talk is cheap. Show me the code. | ',
      \ '           ,RETLHTTLZIJJITJLII11:\-,.*TJI    |                                  | ',
      \ '            <F&TVI6I*+/;:T:I:I-16.,:/J/-     |                   Hello SLSVLLX  | ',
      \ '             .VFTLIII=\;:JL:,...7,7JJ-/      +----------------------------------+ ',
      \ '               `TJCYJJIV/\V,,,/,JVIJ,                                             ',
      \ '                  `TL\:=+L.J==/JFF-                                               ',
      \ '                     `TOD6X&LJF``                                                 ',
      \ '                         ````                                                     ',
      \ '',
      \ ]


function! s:center_skull(lines) abort
  " let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let longest_line = 65  " hardcode the longest length of skull (ignoring the stamp)
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

let g:startify_custom_header = s:center_skull(s:header)
" let g:startify_custom_footer = s:center(s:footer)
let g:startify_files_number = 5

" " Try lazygit Utils
" nnoremap <silent> <Leader>' :call OpenHTerm('lazygit', 0.8)<CR>
" " Handles closing in cases where you would be the last window
" function! CloseWindowOnSuccess(code) abort
"   if a:code == 0
"     let current_window = winnr()
"     bdelete!
"     " Handles special case where window remains due startify
"     if winnr() == current_window
"       close
"     endif
"   endif
" endfunction
" " Open autoclosing terminal, with optional size and dir
" function! OpenTerm(cmd) abort
"   if has('nvim')
"     call termopen(a:cmd, {'on_exit': {_,c -> CloseWindowOnSuccess(c)}})
"   else
"     call term_start(a:cmd, {'exit_cb': {_,c -> CloseWindowOnSuccess(c)}})
"   endif
"   setf openterm
" endfunction
" " Open split with animation
" function! OpenHTerm(cmd, percent) abort
"   if has('nvim') | new | endif
"   call OpenTerm(a:cmd)
"   wincmd J | resize 1
"   call animate#window_percent_height(a:percent)
" endfunction


" When term starts, auto go into insert mode
autocmd TermOpen * startinsert

" Turn off line numbers etc
autocmd TermOpen * setlocal listchars= nonumber norelativenumber

function! ToggleTerm(cmd)
    if empty(bufname(a:cmd))
        call CreateCenteredFloatingWindow()
        call termopen(a:cmd)
    else
        bwipeout!
    endif
endfunction

" Open Project
nnoremap <leader>lg :call ToggleLazyGit()<CR>
function! ToggleLazyGit()
    call ToggleTerm('lazygit')
endfunction

" function! ToggleProject()
"     call ToggleTerm('tmuxinator-fzf-start.sh')
" endfunction

nnoremap <leader>lz :call ToggleScratchTerm()<CR>
function! ToggleScratchTerm()
    call ToggleTerm('zsh')
endfunction

" function! ToggleLazyDocker()
"     call ToggleTerm('lazydocker')
" endfunction



"fzf rg
" nnoremap <leader>f :FZF<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>f<C-L> :Rg<CR>
" nnoremap <leader>fw :Lines <C-R><C-W><CR>
nnoremap <leader>fw :Rg <C-R><C-W><CR>
" " Use ripgrep for fzf
" by default, rg command will ignore files specified in gitignore
let $FZF_DEFAULT_COMMAND='rg --files --hidden --iglob "!.DS_Store" --iglob "!.git"'
let $FZF_DEFAULT_OPTS = '--layout=reverse'
"[fg: text color
"hl: matched character
"fg+: current line text color
"hl+: current line matched character,
"info: how many files in total,
"prompt: ~/ in the top,
"pointer: pointer on the left
"] See https://github.com/junegunn/fzf/wiki/Color-schemes
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Statement'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'Normal'],
            \ 'bg+':     ['bg', 'Normal'],
            \ 'hl+':     ['fg', 'Comment'],  
            \ 'info':    ['fg', 'Comment'],
            \ 'border':  ['fg', 'Comment'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

" Some ripgrep searching defaults
function! RgCommand(ignore) abort
  return join([
    \ 'rg',
    \ '--with-filename', '--hidden', '--color=always', '--column', 
    \ '--iglob "!.DS_Store"', '--iglob "!.git"',
    \ '--line-number', '--no-heading', '--smart-case',
    \ (a:ignore == 1 ? '--ignore' : '--no-ignore')
  \], ' ')
endfunction
" \ '--colors "path:fg:0,255,0"',
" \ '--colors "line:fg:0,255,0"',
" \ '--colors "match:fg:0,255,0"',

" Executes ripgrep with a preview
function! Rg(ignore, args, bang) abort
  let command = RgCommand(a:ignore).' '.shellescape(a:args)
  call fzf#vim#grep(command, 1, 
        \ fzf#vim#with_preview({'options': ['--delimiter=:', '--nth=4..', '--color', 'hl:#BF616A,hl+:#BF616A']}), a:bang)
endfunction
" Opens files search with preview
function! Files(args, bang) abort
  call fzf#vim#files(a:args, fzf#vim#with_preview(), a:bang)
endfunction
" Opens lines with animation
function! Lines(args, bang) abort
  let command = RgCommand(v:true).' '.shellescape(a:args).' '.fnameescape(expand('%'))
  call fzf#vim#grep(command, 1, fzf#vim#with_preview({'options': ['--color', 'hl:#BF616A,hl+:#BF616A']}), 0)
endfunction

" Opens FZF + Ripgrep for not ignored files
command! -bang -nargs=*                       Rg      call Rg(v:true, <q-args>, <bang>0)
" Opens FZF + Ripgrep for all files
command! -bang -nargs=*                       Rgg     call Rg(v:false, <q-args>, <bang>0)
" Opens a file searcher
command! -bang -nargs=? -complete=dir         Files   call Files(<q-args>, <bang>0)
" Opens search of lines in open buffers
command! -bang -nargs=*                       Lines   call Lines(<q-args>, <bang>0)
