r := RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders", "Local AppData")
Run r "\RuneLite\RuneLite.exe"
WinWait("RuneLite")

;Sleep(10000)
Loop
	{
		Sleep 1000
		
        if(WinActive("RuneLite")){
            Sleep(8000)
            WinMove(640,480,1024,768,"RuneLite")
            ;MsgBox("Dont move the RuneLite window, login now.")
           MyGui := Gui(, "OSRS Fishing Bot")
           MyGui.Add("Text",, "Username: ")
           MyGui.Add("Edit", "vuserName")  ; The ym option starts a new column of controls.
           MyGui.Add("Text",,"Password: ")
           MyGui.Add("Edit", "vpassWord")
           MyGui.Add("Button", "default", "OK").OnEvent("Click", ProcessUserInput)
           MyGui.OnEvent("Close", ProcessUserInput)
           MyGui.Show()
		Break
        }
        else
            continue
	}
    ; MsgBox "RuneLite not found.  msg me for help"
    ProcessUserInput(*)
{
    Saved := MyGui.Submit()
    if(Saved.userName!="" && Saved.passWord!=""){
    Sleep(2000)
    ControlClick("x569 y317","RuneLite")
    SendText(Saved.userName) ;sendinput, send or sendtext? how to mimick typing in the details without large keyup keydown series?
    Sleep(2000)   
    Send "{Tab}" ; bugged as of right now.
    SendText(Saved.passWord)
    Sleep(2000)
    Send "{enter}"
    }
    else
        MsgBox("Invalid user credentials.  Try again.")
  
}
#z::Run "https://www.autohotkey.com" ; # is win