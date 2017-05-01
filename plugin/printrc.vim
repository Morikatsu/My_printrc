" vim:set ts=4 sts=4 sw=4 tw=0: (この行に関しては:help modelineを参照)
"	printrc.vim		堀野 守克		Last Change:2017/05/01 15:27:52.
"		$VIM/vim74/plugins/kaoriya//printrc.vim
"
" 印刷に関する設定:
"	_vimrcにあった印刷関係の設定をここに移した。オリジナルのvimrcにある
"	印刷関係の設定は削除する必要がある。削除をしていないと、このファイルの
"	設定が生きない。
" 注釈:
"	用紙の大きさ、フォントサイズを変えた場合は、このファイルを変更する
"	必要がある。
"
" 参考:
"   :hardcopy
"   :help 'printfont'
"   :help printing
"
"----- 行番号付きで印刷 -----------------------------------------------
if &number                     " numberの設定に会わせる
    set printoptions+=number:y
else
    set printoptions+=number:n
endif
"------ 改ページ文字で、改ページする ---------------------------------
set printoptions+=formfeed:y	"改ページ文字で、改ページする
"set printoptions +=fromfeed:n	"                         しない
"----- 用紙の向き -----------------------------------------------------
set printoptions+=portrait:y	"縦
"set printoptions+=portrait:n	"横
"----- 印刷の方法 -----------------------------------------------------
"set printoptions+=duplex:off	"片面印刷
set printoptions+=duplex:long	"両面印刷　綴じ方向縦　長い辺で綴じる
"set printoptions+=duplex:short	"片面印刷　綴じ方向横　短い辺で綴じる
"----- Syntaxハイライト -----------------------------------------------
"set printoptions+=syntax:y    " Syntaxハイライト有効で印刷
set printoptions+=syntax:n    " Syntaxハイライト無効で印刷
"set printoptions+=syntax:a     " カラー印刷可能ならSyntaxハイライト有効
" ------ 印刷用フォント ----- 堀野守克 --- font gothic 9pt -----------
if has('printer')
  if has('win32')
    set printfont=VL_Gothic_Regular:h8:cSHIFTJIS
	"set printfont=VL_Gothic_Regular:h9:cSHIFTJIS
    "set printfont=MS_Mincho:h10:cSHIFTJIS
    "set printfont=MS_Gothic:h9:cSHIFTJIS
  endif
endif
"----- 用紙サイズ -----------------------------------------------------
"		用紙サイズはprinterの設定も行う
"set printoptions+=paper:A4
set printoptions+=paper:B5
"----- 左余白 --------------------------------------------------------
set printoptions+=left:20mm
"----- 印刷ヘッダーの設定  ---堀野守克--- 08/05/11 --------------------
"set printoptions+=header:0  " ヘッダーを印刷しない
"set printoptions+=header:1  " ヘッダー、本文間にスペースを空けない
set printoptions+=header:2   " ヘッダー、本文間に1行入れる

function! Pages()	"---- 堀野守克 ---- 2012/07/09

"		用紙サイズはprinterの設定も行う
"	let	g:linespage = 61	"A4 font 9pt portrait:y
"	let	g:linespage = 68	"A4 font 8pt portrait:y
	let g:linespage = 60	"B5 font 8pt portrait:y
"	let g:linespage = 42	"B5 font 8pt portrait:n(横向き)
"
	let	g:nr1=line('$') / g:linespage
	let g:nr2=line('$') % g:linespage	" %は剰余演算
	if g:nr2 != 0
		let g:nr1 = g:nr1+1
	endif
	return g:nr1
endfunction
"------- 最終更新日時の書式 --------------------------------------------
let autodate_format='%Y/%m/%d %H:%M:%S'
"------- 印刷ヘッダ ----------------------------------------------------
set printheader=%t\ \ Update\ %{strftime(\"\%c\"),getftime(expand(\"\%\%\"))}\ \ \ \ Page\ %N\ /\ %{Pages()}
"----------------------------------------------------------------------
finish
"=====================================================================
