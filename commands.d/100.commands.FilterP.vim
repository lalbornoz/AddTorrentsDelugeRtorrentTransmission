"
" [Function] FilterP(cmdline[, line1, line2]): filter {entire file,visual range} w/ command line w/ tab-complete from favourites
"

let FilterPList = ["sort", "sort | uniq", "fmt -w 75", "hexdump -C"]

fun! FilterP(...) abort
	exe get(a:, 2, 1) . "," . get(a:, 3, "$") . "!" . a:1
endfun
:exe "fun! FilterPCL(...) \n return g:FilterPList \n endfun"
command! -complete=customlist,FilterPCL -nargs=+ FPC call FilterP("<args>")
command! -complete=customlist,FilterPCL -nargs=+ -range FPCR call FilterP("<args>", <line1>, <line2>)

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
