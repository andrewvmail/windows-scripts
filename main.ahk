#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, regex

#include vim.ahk
#include apps.ahk

^F1::
DetectHiddenWindows, Off
WinGet, mylist, list
Loop % mylist {
   hwnd := mylist%A_Index%
   ; msgbox % "Found window with HWND " hwnd
   WinClose % "ahk_id" hwnd
}
return

; ctrl+backspace delete
^BS:: send, ^+{left}{delete}

; always on top
^+SPACE::  Winset, Alwaysontop, , A

; ctrl+win+left(h)
^+h::
  Send {LWin Down}{Left}{LWin Up}
Return

; ctrl+win+right(h)
^+l::
  Send {LWin Down}{Left}{LWin Up}
Return

; ctrl+win+up(j)
^+j::
  Send {LWin Down}{Down}{LWin Up}
Return

; ctrl+win+down(k)
^+k::
  Send {LWin Down}{Up}{LWin Up}
Return


; AHK EDIT

^+r::
  Send, ^s ; To save a changed script
  Sleep, 300 ; give it time to save the script
  Reload
Return

^+e::Edit

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

