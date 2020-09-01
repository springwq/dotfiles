set encoding=utf-8

" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=200
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline
set nu
set ignorecase
set number
set numberwidth=5
set mouse=a
set clipboard=unnamedplus

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

set colorcolumn=+1

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

" Search on the local directory and then go searching to parent directory onwards until root
set tags=tags;/


" Press CTRL-N or CTRL-P in insert-mode to complete the word we’re typing!
set complete+=kspell
imap <Tab> <C-P>

" Turn on spell-checking for Markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

syntax on

filetype plugin indent on
filetype on
filetype indent on

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

" NERDTree
" - Open by Default
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" - Toggle open/close
nnoremap <Leader>f :NERDTreeToggle<Enter>
" - Find
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
" - Auto Close
let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeAutoDeleteBuffer = 1
" - Pretty look
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


" Keyboard mapping
nnoremap <C-p> :<C-u>Files<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>w <C-w>w

inoremap jk <ESC>

" NVIM terminal mode - mapping
" <C-v><ESC> 向在 terminal 中的子程序发送 <Esc> 操作 
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc> 
  tnoremap <leader>h <C-\><C-n><C-w>h
  tnoremap <leader>j <C-\><C-n><C-w>j
  tnoremap <leader>k <C-\><C-n><C-w>k
  tnoremap <leader>l <C-\><C-n><C-w>l
  tnoremap <leader>w <C-\><C-w>w

end

if has('nvim') && executable('nvr')
  let $VISUAL = "nvr -cc vsplit --remote-wait +'set bufhidden=wipe'" 
endif

" Highlight terminal cursor
if has('nvim')
  highlight! link TermCursor Cursor
end

" Color Schema
set background=dark
syntax on
colorscheme gruvbox


" Package Management
packadd minpac
call minpac#init()

" Packages
call minpac#add('morhetz/gruvbox')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('vim-airline/vim-airline')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('jremmen/vim-ripgrep')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-commentary')
call minpac#add('pangloss/vim-javascript')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('hail2u/vim-css3-syntax')
call minpac#add('mattn/emmet-vim')
call minpac#add('maxmellon/vim-jsx-pretty')
call minpac#add('neoclide/coc.nvim')
call minpac#add('preservim/nerdtree')
call minpac#add('Xuyuanp/nerdtree-git-plugin')

" command
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

