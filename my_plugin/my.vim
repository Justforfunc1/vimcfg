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
	call add( titleList, " \\file ".expand("%:t") )
	call add( titleList, " \\brief" )
	call add( titleList, " \\note	注意事项： " )
	call add( titleList, "" )
	call add( titleList, "\\version " )
	call add( titleList, "* \\author lp112124@163.com" )

    if &filetype == 'cpp'
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
	call setline( line("."), "#ifndef _".expand("%:t:r")."_H" )
    call setline( line(".")+1, "#define _".expand("%:t:r")."_H" )
    call setline( line(".")+2, "#endif" )
    call setline( line(".")+3, "" )
    execute ":normal! G$"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DefineCppFile()
    call setline( 11, "#include \"".expand("%:t:r").".h\"" )
    silent execute ":normal! G$"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! UpdateCscopeInfo()
	let absolutePath=getcwd()	
	silent! execute "! find . -iname '*.h' -or -iname '*.c' -or -iname '*.cpp' -or -iname '*.hpp'  > cscope.files" 
	silent! execute "! cscope -bRq -I ".absolutePath."/src 2>>error.cs.log" 
	silent! execute "cs add ".absolutePath."/cscope.out"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! UpdateTags()
	silent! execute "! find . -iname '*.c' -or -iname '*.cpp' -or -iname '*.hpp' -or -iname '*.h' | xargs ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --langmap=c++:+.inl tags "
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetComments()
	execute ":normal! G$"
	let titleList = [ ]
	call add( titleList, "" )
	call add( titleList, "	函数名		：	test" )
	call add( titleList, "" )
	call add( titleList, "	功能		：	测试" )
	call add( titleList, "" )
	call add( titleList, "	参数		：	void" )
	call add( titleList, "" )
	call add( titleList, "	返回值		：	Int32     0:表示成功    其他：表示失败" )
	call add( titleList, "" )
	call add( titleList, "	创建作者	：	Allen.L" )
	call add( titleList, "" )
	call add( titleList, "	修改记录	：" )
	call add( titleList, "" )
	let curList = line(".")+1
	call setline( curList, "/**********************************************************" )
	for title in titleList 
		let curList = curList + 1
		call setline( curList, "".title )
	endfor 
		call setline( curList + 1, "**********************************************************/" )
		call setline( curList + 2, "" )
    execute ":normal! G$"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetCalssComments()
	execute ":normal! G$"
	let titleList = [ ]
	call add( titleList, "" )
	call add( titleList, "	TEST			类注释" )
	call add( titleList, "" )
	call add( titleList, "	类名		：	test" )
	call add( titleList, "" )
	call add( titleList, "	作者		：	Allen.L" )
	call add( titleList, "" )
	call add( titleList, "	创建时间	：" )
	call add( titleList, "" )
	call add( titleList, "	类描述		：" )
	call add( titleList, "" )
	let curList = line(".")+1
	call setline( curList, "/**********************************************************" )
	for title in titleList 
		let curList = curList + 1
		call setline( curList, "".title )
	endfor 
		call setline( curList + 1, "**********************************************************/" )
		call setline( curList + 2, "" )
    execute ":normal! G$"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
