" Original: http://www.vim.org/scripts/script.php?script_id=2557
"
" Modified to also read .git/info/exclude

for filename in ['.gitignore', '.git/info/exclude']
    if filereadable(filename)
        let igstring = ''
        for oline in readfile(filename)
            let line = substitute(oline, '\s|\n|\r', '', "g")
            if line =~ '^#' | con | endif
            if line == '' | con  | endif
            if line =~ '^!' | con  | endif
            if line =~ '/$' | let igstring .= "," . line . "*" | con | endif
            let igstring .= "," . line
        endfor
        let execstring = "set wildignore=".substitute(igstring, '^,', '', "g")
        execute execstring
    endif
endfor
