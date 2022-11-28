>!c:: ;chrome 
IfWinExist, ahk_exe chrome.exe 
	{	
		WinActivate
	} Return

>!w:: ;webstorm 
IfWinExist, ahk_exe webstorm64.exe
	{	
		WinActivate
	} Return

>!v:: ;vscode 
IfWinExist, ahk_exe Code.exe
	{	
		WinActivate
	} Return

>!n:: ;notepad 
IfWinExist, ahk_exe Notepad.exe
	{	
		WinActivate
	} Return

>!m:: ; whastapp
IfWinExist, ahk_exe WhatsApp.exe
	{	
		WinActivate
	} Return

>!u:: ; ubuntu wsl
IfWinExist, ahk_exe ubuntu.exe
	{	
		WinActivate
	} Return

>!g:: ; datagrip 
IfWinExist, ahk_exe datagrip64.exe
	{	
		WinActivate
	} Return

>!a:: ; cmd
IfWinExist, ahk_exe cmd.exe
	{	
		WinActivate
	} Return

>!s:: ; sublime
IfWinExist, ahk_exe sublime_text.exe
	{	
		WinActivate
	} Return

>!z:: ; powershell
IfWinExist, ahk_exe powershell.exe
	{	
		WinActivate
	} Return

>!f:: ; fork
IfWinExist, ahk_exe Fork.exe
	{	
		WinActivate
	} Return

>!e:: ; electron app 
IfWinExist, ahk_exe electron.exe
	{	
		WinActivate
	} Return
