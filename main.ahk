#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, regex

#include vim.ahk
#include apps.ahk
#include memo.ahk

; ctrl+backspace delete
^BS:: send, ^+{left}{delete}

; reload ahk scripts, mainly used in sublime 
#IfWinActive, .*\.ahk*.
^r:: ; press control+r to reload
  Msgbox, Do you really want to reload this script?
  ifMsgBox, Yes
    Reload
  Return


; Based on https://superuser.com/a/768060/542406
!`:: ; Next window
WinGet, ActiveProcessName, ProcessName, A
WinGet, WinClassCount, Count, ahk_exe %ActiveProcessName%
IF WinClassCount = 1
    Return
Else
WinSet, Bottom,, A
WinActivate, ahk_exe %ActiveProcessName%
return

!+`:: ; Last window
WinGet, ActiveProcessName, ProcessName, A
WinGet, WinClassCount, Count, ahk_exe %ActiveProcessName%
IF WinClassCount = 1
    Return
Else
WinActivateBottom, ahk_exe %ActiveProcessName%
return

