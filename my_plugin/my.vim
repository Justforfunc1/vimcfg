if exists("loaded_myvim")
    finish
endif
let loaded_myvim = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Initialization()
	if( IsIDE() == 1 ) 
		call UpdateCscopeInfo()
	endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mIsIDE = 0
function! IsIDE()
	let absolutePath=getcwd()

	let sourceNameList = [ "src", "source" ]
	for sourceName in sourceNameList
		let findDirName = finddir( sourceName, absolutePath )
		if sourceName == findDirName 
			let g:mIsIDE = 1	
		endif
	endfo

	return g:mIsIDE
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetTitle()
	let titleList = [ ]
	call add( titleList, " Copyright (C) ".strftime("%Y")." All rights reserved." )
	call add( titleList, " \\file ".expand("%:t") )
	call add( titleList, " \\brief" )
	call add( titleList, " \\note	注意事项：" )
	call add( titleList, "" )
	call add( titleList, "\\version 1.0" )
	call add( titleList, "* \\author Allen.L" )
	call add( titleList, "* \\date ".strftime("%Y-%m-%d") )

    if &filetype == 'cpp' || &filetype == 'cc' || &filetype == 'c'
		let curList = 1
		call setline( curList, "/**********************************************************" )

		for title in titleList 
			let curList = curList + 1
			call setline( curList, " *".title )
		endfor 
		call setline( curList + 1, "**********************************************************/" )
		call setline( curList + 2, "" )
    else
        echom "filetype is ".&filetype
    endif

    execute ":normal! G$"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DefineHeadFile()
    execute ":normal! G$"
	call setline( line("."), "#ifndef _".toupper(expand("%:t:r"))."_H" )
    call setline( line(".")+1, "#define _".toupper(expand("%:t:r"))."_H" )
    call setline( line(".")+2, "#endif" )
    call setline( line(".")+3, "" )
    execute ":normal! G$"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DefineCppFile()
    silent execute ":normal! G$"
    call setline( line("." ), "#include \"".expand("%:t:r").".h\"" )
    silent execute ":normal! G$"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! UpdateCscopeInfo()
	let absolutePath=getcwd()	
"	silent! execute "! find . -iname '*.h' -or -iname '*.c' -or -iname '*.cpp' -or -iname '*.hpp'  > cscope.files" 
	silent! execute "! cscope -bRq -I ".absolutePath."/src 2>>error.cs.log" 
	silent! execute "cs add ".absolutePath."/cscope.out"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! UpdateTags()
	silent! execute "! /usr/bin/rm -rf tags"
	silent! execute "! touch tags"
	silent! execute "! find . -iname '*.c' -or -iname '*.cpp' -or -iname '*.hpp' -or -iname '*.h' | xargs ctags --c++-kinds=+p --fields=+iaS --extra=+q --langmap=c++:+.inl -a tags "
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DefineScriptFile()
    execute ":normal! G$"
	if &filetype == 'lua'
		call setline( line("."), '-- '."Copyright (C) Allen.L, CloudFlare Inc." )
	elseif &filetype == 'sh'
		call setline( line("."), '#'."!/bin/bash" )
		call setline( line(".")+1, '#' )
		call setline( line(".")+2, '#'."brief：" )
	else
		echom "filetype is ".&filetype
	endif

    execute ":normal! G$"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetComments()
	execute ":normal! G$"
    execute ":normal! G$"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetCalssComments()
	execute ":normal! G$"
    execute ":normal! G$"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
