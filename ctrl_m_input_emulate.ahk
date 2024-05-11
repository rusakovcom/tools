; Please Install https://www.autohotkey.com/download/ahk-install.exe
; As next step run this script, it works in the background and emulates pasting (from buffer) as keyboard input after pressing Ctrl+M



^m::
Send, ^c ; Copy selected text
ClipWait ; Wait for the clipboard to contain data
Send, %Clipboard% ; Send the clipboard content as keyboard input
return
