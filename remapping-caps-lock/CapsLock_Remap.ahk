#Requires AutoHotkey v2.0
#SingleInstance Force

MsgBox("This script is running on AutoHotkey v2.")

; ############ Key Remap ############
RShift::CapsLock
CapsLock::Ctrl
$^g::SendInput("{Esc}{Esc}")                                                ; Escape

#HotIf WinActive("ahk_exe emacs.exe")
$^g::SendInput("^g")                                                        ; C-g
$^w::SendInput("^{Backspace}")                                              ; Use C-S-w
#HotIf ; only in emacs.exe

#HotIf WinActive("ahk_exe obsidian.exe")
$^+!1::MsgBox("This shortcut works only in obsidian.exe.")
$!p::SendInput("!p")                                                        ; Move line up
$!n::SendInput("!n")                                                        ; Move line down
$^+p::SendInput("^+p")                                                      ; Command palette
$^+w::SendInput("^+w")                                                      ; Close tab
$^+n::SendInput("^+n")                                                      ; New file
$^+k::SendInput("^+k")                                                      ; Delete line
$^+f::SendInput("^+f")                                                      ; Find
$^;::SendInput("^;")                                                        ; Comment
$^+;::SendInput("^+;")                                                      ; Uncomment
$!.::SendInput("!.")                                                        ; Browser forward history
$!,::SendInput("!,")                                                        ; Browser back history
#HotIf ; only in obsidian.exe

#HotIf WinActive("ahk_exe WINWORD.EXE")
$^+!1::MsgBox("This shortcut works only in WINWORD.EXE.")
$^+k::SendInput("{End}+{Home}{Delete}{End}")                                ; Delete line
$!p::SendInput("{End}+{Home}^x{Up}{Enter}{Up}^v")                           ; Move line up
$!n::SendInput("{End}+{Home}^x{End}{Enter}^v")                              ; Move line down
#HotIf ; WINWORD.EXE

#HotIf WinActive("ahk_exe EXCEL.EXE") ; #HotIf WinActive("ahk_class XLMAIN")
$^+!1::MsgBox("This shortcut works only in Excel.")
$^+z::SendInput("{End}+{Home}^c{End}!{Enter}^v+{Home}^+{Right}{Delete}")    ; Modified duplicate line
$!d::SendInput("^+{Right}{Delete}")                                         ; Ctrl delete
$^w::SendInput("^+{Left}{Backspace}")                                       ; Ctrl backspace
$^j::SendInput("{End}!{Enter}")                                             ; Insert line below
$^o::SendInput("{Home}!{Enter}{Up}")                                        ; Insert line above
$!p::SendInput("{End}+{Home}^c{Delete}{Delete}{Up}!{Enter}{Up}^v")          ; Move line up
$!n::SendInput("{End}+{Home}^c{Delete}{Delete}{End}!{Enter}^v")             ; Move line down
$^l::SendInput("^{Home}^+{End}^c{Esc}")                                     ; Copy
$^i::SendInput("{F2}")                                                      ; Insert mode
$^y::SendInput("^+{Home}^v^{Enter}")                                        ; Yank
$^+d::SendInput("^d")                                                       ; Duplicate cell
$^!p::SendInput("!{Up}")                                                    ; Excel drop-up menu
$^!n::SendInput("!{Down}")                                                  ; Excel drop-down menu
$^+!i::SendInput("+{Up}{Esc}")                                              ; Cell selection
$^+!k::SendInput("+{Down}{Esc}")                                            ; Cell selection
$^+!j::SendInput("+{Left}{Esc}")                                            ; Cell selection
$^+!l::SendInput("+{Right}{Esc}")                                           ; Cell selection
$^+!p::SendInput("^+{Up}{Esc}")                                             ; Cell selection
$^+!n::SendInput("^+{Down}{Esc}")                                           ; Cell selection
$^+!,::SendInput("^+{Left}{Esc}")                                           ; Cell selection
$^+!.::SendInput("^+{Right}{Esc}")                                          ; Cell selection
$^.::SendInput("^{PgDn}")                                                   ; Switch sheet forward
$^,::SendInput("^{PgUp}")                                                   ; Switch sheet backward
#HotIf ; in EXCEL.EXE only

#HotIf not WinActive("ahk_exe Code.exe") and not WinActive("ahk_exe emacs.exe")
$^+!1::MsgBox("This shortcut works everywhere, but not in VS Code and Emacs.")
$^p::SendInput("{Up}")                                                      ; Up
$^n::SendInput("{Down}")                                                    ; Down
$^f::SendInput("{Right}")                                                   ; Right
$^b::SendInput("{Left}")                                                    ; Left
$!f::SendInput("^{Right}")                                                  ; Forward one word
$!b::SendInput("^{Left}")                                                   ; Backward one word
$^a::SendInput("{Home}")                                                    ; Home
$^e::SendInput("{End}")                                                     ; End
$!<::SendInput("^{Home}")                                                   ; Beginning of file
$!>::SendInput("^{End}")                                                    ; End of file
$^d::SendInput("{Delete}")                                                  ; Delete
$^h::SendInput("{Backspace}")                                               ; Backspace
$^u::SendInput("+{Home}{Backspace}")                                        ; Delete line forward
$^k::SendInput("+{End}{Delete}")                                            ; Delete line backward
$^+k::SendInput("{End}+{Home}{Delete}{Backspace}{Down}{End}")               ; Delete line
$^/::SendInput("^z")                                                        ; Undo
$^m::SendInput("^y")                                                        ; Redo
$^+y::SendInput("^y")                                                       ; Redo
$^+a::SendInput("^a")                                                       ; Select all
$^+x::SendInput("^x")                                                       ; Cut
$^+c::SendInput("^c")                                                       ; Copy
$^+v::SendInput("^v")                                                       ; Paste
$^y::SendInput("^v")                                                        ; Yank
$^+w::SendInput("^w")                                                       ; Close tab
$^+f::SendInput("^f")                                                       ; Find
$^+g::SendInput("^g")                                                       ; Go
$^+h::SendInput("^h")                                                       ; Replace
$^+n::SendInput("^n")                                                       ; New file
$^+p::SendInput("^p")                                                       ; Print
$!.::SendInput("!{Right}")                                                  ; Browser forward history
$!,::SendInput("!{Left}")                                                   ; Browser back history

is_first_select_action := true                                              ; Expand line selection
~Shift Up::
{
    global is_first_select_action
    is_first_select_action := true
    return
}
$+Space::
{
    global is_first_select_action
    if (is_first_select_action) {
        SendInput "{Home}+{End}"
        is_first_select_action := false
    }
    else {
        SendInput "+{Right}+{End}"
    }
    return
}
#HotIf ; not in Code and emacs

#HotIf not WinActive("ahk_exe EXCEL.EXE") and not WinActive("ahk_exe Code.exe") and not WinActive("ahk_exe emacs.exe")
$^+!2::MsgBox("This shortcut works everywhere, but not in EXCEL, Code and emacs.")
$^v::SendInput("{PgDn}")                                                    ; Scroll Down
$!v::SendInput("{PgUp}")                                                    ; Scroll Up
$^;::SendInput("{Home};{Space}{Home}{Down}")                                ; Comment
$^+;::SendInput("{Home}{Delete}{Delete}{Down}")                             ; Uncomment
$!d::SendInput("^{Delete}")                                                 ; Ctrl delete
$^w::SendInput("^{Backspace}")                                              ; Ctrl backspace
$^j::SendInput("{End}{Enter}")                                              ; Insert line below
$^o::SendInput("{Home}{Enter}{Up}")                                         ; Insert line above
$^+z::SendInput("{Home}+{End}^c{End}{Enter}^v")                             ; Duplicate line
$!p::SendInput("{End}+{Home}^c{Delete}{Backspace}{Home}^v{Enter}{Up}{End}") ; Move line up
$!n::SendInput("{End}+{Home}^c{Backspace}{Delete}{End}{Enter}^v")           ; Move line down
#HotIf ; not in EXCEL-Code-emacs
