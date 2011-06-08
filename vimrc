" Pathogen
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()


" Some common settings

syntax on
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set mouse=a
set showtabline=2
set backspace=indent,eol,start
set ruler

colorscheme railscasts


" Line numbers

set number
highlight LineNr ctermfg=White ctermbg=DarkGrey guifg=White guibg=DarkGrey


" Key mappings

map <F12> :NERDTreeToggle <CR>

:nmap <S-Left> :tabprevious<cr>
:nmap <S-Right> :tabnext<cr>

:nmap <C-t> :tabnew<cr>
:imap <C-t> <ESC>:tabnew<cr>
:map <C-t> :tabnew<cr>

:map <C-w> :tabclose<cr>

:map <C-n> :tabnew<cr><Leader>t
:map <C-e> <Leader>t

:map <C-g> :Gblame<cr>


" Delete white space at the end of line

function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

autocmd FileType c,cpp,java,php,python autocmd FileWritePre * :call TrimWhiteSpace()
autocmd FileType c,cpp,java,php,python autocmd FileAppendPre * :call TrimWhiteSpace()
autocmd FileType c,cpp,java,php,python autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd FileType c,cpp,java,php,python autocmd BufWritePre * :call TrimWhiteSpace()


" Show tabs and white space

set list listchars=tab:»·,trail:·


" Language-specific options. Maybe extract those to separate files at some
" point.

" PHP support

au FileType php au BufRead,BufNewFile * noremap <C-L> :!php -l %<CR>


" Javascript support

au FileType javascript set tabstop=2
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2

" Use tabs in makefiles

autocmd FileType make setlocal noexpandtab
