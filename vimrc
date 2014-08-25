" Pathogen
call pathogen#infect()
call pathogen#helptags()


" Some common settings

syntax on
filetype plugin indent on
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set mouse=a
set showtabline=2
set backspace=indent,eol,start
set ruler

colorscheme github

if has("gui_running")
  set guifont=Menlo\ Regular:h16
endif


" Line numbers

set number


" Key mappings

map <F12> :NERDTreeToggle <CR>

:nmap <C-S-tab> :tabprevious<cr>
:nmap <C-tab> :tabnext<cr>

:nmap <C-t> :tabnew<cr>
:imap <C-t> <ESC>:tabnew<cr>
:map <C-t> :tabnew<cr>

:map <C-w> :tabclose<cr>

:map <C-n> :tabnew<cr><Leader>t
:map <C-e> <Leader>t

:map <C-g> :Gblame<cr>


" Delete white space at the end of line

function StripTrailingWhitespace()
  let l:winview = winsaveview()
  silent! %s/\s\+$//
  call winrestview(l:winview)
:endfunction

autocmd FileType c,cpp,javascript,ruby,php,python autocmd BufWritePre * :call StripTrailingWhitespace()


" Show tabs and white space

set list listchars=tab:»·,trail:·

" http://vim.wikia.com/wiki/VimTip1386
:set completeopt=longest,menuone
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
:inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
:inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


" Close the Omni-Completion tip window when a selection is made.
" http://stackoverflow.com/questions/3105307/how-do-you-automatically-remove-the-preview-window-after-autocompletion-in-vim
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Additional file types
au BufNewFile,BufRead *.pp set filetype=puppet


" Language-specific options. Maybe extract those to separate files at some
" point.

" PHP support

au FileType php au BufRead,BufNewFile * noremap <C-L> :!php -l %<CR>


" Javascript support

au FileType javascript set tabstop=2
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2

" CoffeeScript support

au FileType coffee set tabstop=2
au FileType coffee set shiftwidth=2
au FileType coffee set softtabstop=2

" Use tabs in makefiles

autocmd FileType make setlocal noexpandtab


" Ruby preferences

au FileType ruby set tabstop=2
au FileType ruby set shiftwidth=2
au FileType ruby set softtabstop=2


" Puppet

au FileType puppet set tabstop=2
au FileType puppet set shiftwidth=2
au FileType puppet set softtabstop=2


" Clojure

au FileType clojure :RainbowParenthesesActivate
au FileType clojure :RainbowParenthesesLoadRound
au FileType clojure :RainbowParenthesesLoadSquare
au FileType clojure :RainbowParenthesesLoadBraces
