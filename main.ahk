#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, regex

#include apps.ahk

; don't use powertoys
Capslock::Control
Control::Esc
Esc::`

; vim like movements
^j:: Send {Down}
^k:: Send {Up}
^h:: Send {Left}
^l:: Send {Right}

; Delete
^BS:: send, {Delete}
Return

; always on top
^+SPACE::  Winset, Alwaysontop, , A
Return

^+r::
  Send, ^s ; To save a changed script
  Sleep, 300 ; give it time to save the script
  Reload
Return

^+e::Edit
Return

; Same window toggle

; Based on https://superuser.com/a/768060/542406
!`:: ; Next window ALT + `
WinGet, ActiveProcessName, ProcessName, A
WinGet, WinClassCount, Count, ahk_exe %ActiveProcessName%
IF WinClassCount = 1
    Return
Else
WinSet, Bottom,, A
WinActivate, ahk_exe %ActiveProcessName%
return

!+`:: ; Last window ALT + SHIFT + `
WinGet, ActiveProcessName, ProcessName, A
WinGet, WinClassCount, Count, ahk_exe %ActiveProcessName%
IF WinClassCount = 1
    Return
Else
WinActivateBottom, ahk_exe %ActiveProcessName%
return

