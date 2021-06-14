#c:: 
IfWinExist, ahk_class Chrome_WidgetWin_1
	{	WinActivate
	}
else
	{	Run, C:\Documents and Settings\user\Local Settings\Application Data\Google\Chrome\Application\chrome.exe
	}
return 

#w:: 
IfWinExist, ahk_class SunAwtFrame
	{	WinActivate
	}
else
	{	Run, C:\Users\momo\Desktop\Webstorm
	}
return 	