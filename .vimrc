" pathogen plugin manager
execute pathogen#infect()

" show line numbers
set number
set relativenumber

" syntax highlighting
syntax on
set bg=dark
colorscheme kraihlight

" autoindent
set autoindent
set smartindent

" Keep 3 lines below and above the cursor
set scrolloff=3

" 2 space tabs
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2

" incremental search, case insensitive when using lower
set incsearch
set ignorecase
set smartcase

" highlight search matches
" ... and clear search hl with 'esc'
set hlsearch
nnoremap <F1> :nohl<Enter>

" show matching brackets
set showmatch

" show undesired blanks
"set list
"set listchars=tab:,.,trail:.,extends:#,nbsp:.

" history & undo BIG TIME
set history=1000
set undolevels=1000

" make tab in v mode ident code
vmap <tab> >gv 
vmap <s-tab> <gv 
" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>
" make s-tab in insert mode unident code
imap <s-tab> <bs>

" open vsplits on the right
set splitright

" comment/uncomment blocks of code in vmode
vmap _c :s/^/#/gi<Enter>
vmap _C :s/^#//gi<Enter>

" ease tab navigation
map <c-t> :tabnew<Enter>
map <c-w> :tabclose<Enter>
map <F7> :tabp<Enter>
map <F8> :tabn<Enter>
nnoremap <s-h> :tabp<Enter>
nnoremap <s-l> :tabn<Enter>


" tab relocation
nnoremap <s-j> :execute 'tabmove' tabpagenr() - 2 <CR>
nnoremap <s-k> :execute 'tabmove' tabpagenr() <CR>

" ease window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" convenience mappings
nmap ñ :
nmap º <esc>
vmap º <esc>
imap º <esc>

" HATE stumbling into 'Q' instead of ':q'
map Q :q

" paste mode
set pastetoggle=<F9>

" powerline config
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
" Always show statusline
set laststatus=2
" Use 256 colors
set t_Co=256

" CtrlP config
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
" override max files default
let g:ctrlp_max_files=0
" jump to file if already open
let g:ctrlp_switch_buffer = 'Et'
" open new file in a tab right after the current one
let g:ctrlp_tabpage_position = 'ac'
" open new files in a tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" NerdTree config
map <C-n> :NERDTreeToggle<CR>

filetype plugin on
set omnifunc=syntaxcomplete#Complete

"Omni menu colors
hi Pmenu ctermfg=15 ctermbg=235 cterm=bold
hi PmenuSel ctermfg=15 ctermbg=238 gui=bold

" YouCompleteMe config
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_auto_trigger = 1

" backspace not in vim-style
set backspace=indent,eol,start

" reopen file at last-edited position
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" default templates for new files
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.template

" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1

" perl subroutine signatures, biatch
"let perl_sub_signatures = 1
"let perl_no_subprototype_error = 1

" check perl code with :make
"autocmd FileType perl set makeprg=perl\ -c\ %\ $*
"autocmd FileType perl set errorformat=%f:%l:%m
"autocmd FileType perl set autowrite

" habits, habits: disable arrow keys in normal & insertion modes
nmap <up> <nop>
imap <up> <nop>
nmap <down> <nop>
imap <down> <nop>
nmap <left> <nop>
imap <left> <nop>
nmap <right> <nop>
imap <right> <nop>


" Tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>

" Restore EasyMotion config to be triggered by leader
"map <Leader> <Plug>(easymotion-prefix)
map ç <Plug>(easymotion-prefix)

" Session management
map <F5> :mksession! ~/vim_session <cr>
map <F6> :source ~/vim_session <cr>

" Leader more accessible
let mapleader = "ç"

" Window Swap
nnoremap <silent> çww :call WindowSwap#EasyWindowSwap()<CR>
