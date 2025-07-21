#Requires AutoHotkey v2.0
#SingleInstance Force

MsgBox("This script is running on AutoHotkey v2.")

; ############ Emacs FTW ############
RShift::CapsLock
CapsLock::Ctrl

; ############ Toogle comment ############
$^;::SendInput("{Home};{Space}{Home}{Down}")     ; comment
$^+;::SendInput("{Home}{Delete}{Delete}{Down}")  ; uncomment

; ############ Navigation ############
$^p::SendInput("{Up}")                           ; Up
$^n::SendInput("{Down}")                         ; Down
$^f::SendInput("{Right}")                        ; Right
$^b::SendInput("{Left}")                         ; Left
$!f::SendInput("^{Right}")                       ; forward one word
$!b::SendInput("^{Left}")                        ; backward one word
$^a::SendInput("{Home}")                         ; home
$^e::SendInput("{End}")                          ; end
$!<::SendInput("^{Home}")                        ; beginning of file
$!>::SendInput("^{End}")                         ; end of file

; ############ Edit ############
$^d::SendInput("{Delete}")                                         ; delete
$^h::SendInput("{Backspace}")                                      ; backspace
$!d::SendInput("^+{Right}{Delete}")                                ; alt delete
$!h::SendInput("^+{Left}{Backspace}")                              ; alt backspace
$^k::SendInput("+{End}{Delete}")                                   ; delete line backward
$^u::SendInput("+{Home}{Backspace}")                               ; delete line forward
$^+k::SendInput("{End}+{Home}{Delete}{Backspace}{Down}{End}")      ; delete line
$^j::SendInput("{End}!{Enter}")                                    ; insert line below
$^o::SendInput("{Home}!{Enter}{Up}")                               ; insert line above
$!n::SendInput("{End}+{Home}^c{Delete}{Delete}{End}!{Enter}^v")    ; move line down
$!p::SendInput("{End}+{Home}^c{Delete}{Delete}{Up}!{Enter}{Up}^v") ; move line up

; ############ Basic Commands ############
$^g::SendInput("{Esc}{Esc}")                     ; Escape
$^y::SendInput("^+{Home}^v^{Enter}")             ; yank 
$^+y::SendInput("^y")                            ; Redo 
$^?::SendInput("^y")                             ; Redo 
; $^+z::SendInput("{Home}+{End}^c{End}{Enter}^v")                          ; duplicate line
$^+z::SendInput("{Home}+{End}^c{End}!{Enter}^v+{Home}^+{Right}{Delete}") ; modified duplicate line
$^+f::SendInput("^f")                            ; find 
$^+g::SendInput("^g")                            ; go 
$^+h::SendInput("^h")                            ; replace 
$^+n::SendInput("^n")                            ; new file 
$^+p::SendInput("^p")                            ; print 
$^i::SendInput("{F2}")                           ; insert mode (not compatible)
$^l::SendInput("^{Home}^+{End}^c{End}{Esc}")     ; copy 
$^/::SendInput("^z")                             ; undo 
$^+d::SendInput("^d")                            ; duplicate cell
$^Tab::SendInput("^{PgDn}")                      ; switch tab forward 
$^+Tab::SendInput("^{PgUp}")                     ; switch tab backward
$!.::SendInput("!{Right}")                       ; browser forward history
$!,::SendInput("!{Left}")                        ; browser back history
$^+a::SendInput("^a")                            ; select all
$^+Space::SendInput("{Home}+{End}")              ; select line
$^!p::SendInput("!{Up}")                         ; excel drop-up menu
$^!n::SendInput("!{Down}")                       ; excel drop-down menu
$^+!i::SendInput("+{Up}{Esc}")                   ; cell selection
$^+!k::SendInput("+{Down}{Esc}")                 ; cell selection
$^+!j::SendInput("+{Left}{Esc}")                 ; cell selection
$^+!l::SendInput("+{Right}{Esc}")                ; cell selection
$^+!p::SendInput("^+{Up}{Esc}")                  ; cell selection
$^+!n::SendInput("^+{Down}{Esc}")                ; cell selection
$^+!,::SendInput("^+{Left}{Esc}")                ; cell selection
$^+!.::SendInput("^+{Right}{Esc}")               ; cell selection
$^!i::SendInput("^{Up}")                         ; cell selection
$^!k::SendInput("^{Down}")                       ; cell selection
$^!j::SendInput("^{Left}")                       ; cell selection
$^!l::SendInput("^{Right}")                      ; cell selection
