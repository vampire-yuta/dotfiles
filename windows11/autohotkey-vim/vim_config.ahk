; Windows Terminalがアクティブな場合は以下のホットキーを無効化
#IfWinNotActive ahk_exe WindowsTerminal.exe

; Ctrl + h でカーソルを左に移動
^h::
    Send, {Left}
return

; Ctrl + l でカーソルを右に移動
^l::
    Send, {Right}
return

; Ctrl + j でカーソルを下に移動
^j::
    Send, {Down}
return

; Ctrl + k でカーソルを上に移動
^k::
    Send, {Up}
return

; Ctrl + L の代わりに Alt + l で画面をクリア
!l::
    Send, ^l
return

; Ctrl + 0 で行の先頭に移動
^0::
    Send, {Home}
return

; Ctrl + b で行の先頭に移動
^b::
    Send, {Home}
return

; Ctrl + e で行の最後に移動
^e::
    Send, {End}
return
#IfWinActive
