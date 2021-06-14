#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, regex

#include vim.ahk
#include apps.ahk

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

Unique_Alt_Tab_Windows()
{
  alt_tab_list := Array()
  class_list := ""
  WinGet, window_list, List
  Loop % window_list
  {
    this_hwnd := window_list%A_Index%

    
    WinGet, this_style, Style, ahk_id %this_hwnd%
    if (this_style & 0x10000000) && (this_style & 0x10000) ; 0x10000000 is WS_VISIBLE. 0x10000 is WS_MAXIMIZEBOX
    {
      WinGetTitle, this_title, ahk_id %this_hwnd%
      if((this_title = "") || (this_title = "Start"))
        continue
      else
      {
        WinGetClass, this_class, ahk_id %this_hwnd%
        if !InStr(class_list, this_class)
        {
          alt_tab_list.Insert(this_hwnd)
          class_list .= this_class . "|"
        }
      }
    }
  }
  return alt_tab_list
}

#IfWinActive
!Tab::

alt_tab_list := Unique_Alt_Tab_Windows()
initial_window := alt_tab_list[2]
WinActivate, ahk_id %initial_window%
active_index := 2
Loop
{
  
  KeyWait, Tab, DT0.5
  if !ErrorLevel
  {
    active_index++
    this_window := alt_tab_list[active_index]
    WinActivate, ahk_id %this_window%
  }
  if(active_index >= alt_tab_list.MaxIndex())
  {
    alt_tab_list := Unique_Alt_Tab_Windows()
    active_index := 1
  }
} until (!GetKeyState("Alt", "P"))
return


