set nocompatible
filetype off 
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim'
Plug 'airblade/vim-gitgutter'
call plug#end()

filetype plugin indent on
inoremap jk <ESC>
map <silent> <C-n> :NERDTreeFocus<CR>
map <silent> <C-m> :NERDTreeToggle<CR>
map <silent> <C-/> :NERDCommenterToggle<CR>
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDTreeIgnore = ['^node_modules$']

let g:airline#extensions#tabline#enabled = 1

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nnoremap tn :tabnew<Space>

nnoremap tk :tabnext<Space>
nnoremap tj :tabprev<Space>
nnoremap th :tabfirst<Space>
nnoremap tl :tablast<Space>

 " Remap for rename current word
nmap <F2> <Plug>(coc-rename)

colorscheme gruvbox

set encoding=UTF-8
syntax on
set colorcolumn=80
set hlsearch
set number
set relativenumber
set background=dark
let g:webdevicons_enable = 1
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-pairs',
\ 'coc-tsserver',
\ 'coc-eslint', 
\ 'coc-prettier', 
\ 'coc-json', 
\ ]
" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction


" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()
" prettier command for coc
 command! -nargs=0 Prettier :CocCommand prettier.formatFile
 let g:airline_theme='biogoo'
 let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

