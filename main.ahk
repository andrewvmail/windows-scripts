#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, regex
SetNumLockState, AlwaysOff 
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff
#MaxHotkeysPerInterval,50000

; https://www.autohotkey.com/boards/viewtopic.php?t=33437
Gui, -Caption
Gui, Add, ListView, w300 r40 Grid, HOTKEY|COMMENT
for Index, Element in Hotkeys(Hotkeys)
    LV_Add("",Element.Hotkey, Element.Comment)
LV_ModifyCol()

; Hotkey to show|hide the GUI:
F1:: ; Gui hotkeys
    If (Toggle := !Toggle)
     Gui, Show, x600 y800
    else
     Gui, Cancel
return

; Read Hotkeys from Script File
Hotkeys(ByRef Hotkeys)
{
    FileRead, MainScript, %a_scriptdir%\main.ahk
    MainScript:=  RegExReplace(MainScript, "ms`a)^\s*/\*.*?^\s*\*/\s*|^\s*\(.*?^\s*\)\s*")
    
    FileRead, AppsScript, %a_scriptdir%\apps.ahk
    AppsScript:=  RegExReplace(AppsScript, "ms`a)^\s*/\*.*?^\s*\*/\s*|^\s*\(.*?^\s*\)\s*")

    MergedScript = %MainScript%%AppsScript%

    Hotkeys := {}
    Loop, Parse, MergedScript, `n, `r
        if RegExMatch(A_LoopField,"^\s*(.*):`:.*`;\s*(.*)",Match)
        {
            if !RegExMatch(Match1,"(Shift|Alt|Ctrl|Win)")
            {
                StringReplace, Match1, Match1, +, Shift+
                StringReplace, Match1, Match1, <^>!, AltGr+
                StringReplace, Match1, Match1, <, Left, All
                StringReplace, Match1, Match1, >, Right, All 
                StringReplace, Match1, Match1, !, Alt+
                StringReplace, Match1, Match1, ^, Ctrl+
                StringReplace, Match1, Match1, #, Win+
            }
            Hotkeys.Push({"Hotkey":Match1, "Comment":Match2})
        }

    return Hotkeys
}


#include apps.ahk

; don't use powertoys
Capslock::LCtrl ; Capslock is remap to Left Control
; buggy in apex

; vim like movements
^j:: Send {Down} ; down
^k:: Send {Up} ; up
^h:: Send {Left} ; left 
^l:: Send {Right} ; right

; alt ctrl 4
!^4:: Send !{f4} ; close window

; Delete
^BS:: send, {Delete} ; del
Return

; always on top
^+SPACE::  Winset, Alwaysontop, , A ; always on top
Return

^+r:: ; reload ahk
  Send, ^s ; To save a changed script
  Sleep, 300 ; give it time to save the script
  Reload
Return

^+e::Edit ; edit ahk
Return

; Same window toggle

; Based on https://superuser.com/a/768060/542406
!`:: ; next window
WinGet, ActiveProcessName, ProcessName, A
WinGet, WinClassCount, Count, ahk_exe %ActiveProcessName%
IF WinClassCount = 1
    Return
Else
WinSet, Bottom,, A
WinActivate, ahk_exe %ActiveProcessName%
return

!+`:: ; prev windows of same kind
WinGet, ActiveProcessName, ProcessName, A
WinGet, WinClassCount, Count, ahk_exe %ActiveProcessName%
IF WinClassCount = 1
    Return
Else
WinActivateBottom, ahk_exe %ActiveProcessName%
return


