#c:: 
IfWinExist, ahk_exe chrome.exe 
	{	
		WinActivate
	}
else
	{	Run, C:\Users\momo\Desktop\Google Chrome
	}
return 

#w:: 
IfWinExist, ahk_exe webstorm64.exe
	{	
		WinActivate
	}
else
	{	
		Run, C:\Users\momo\Desktop\Webstorm 
	}
return 	