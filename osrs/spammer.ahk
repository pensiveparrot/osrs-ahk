MyGui := Gui(, "Spammer")
MyGui.Add("Text",, "Text to Spam:")

MyGui.Add("Edit", "vFirstName ym")  ; The ym option starts a new column of controls.
MyGui.Add("Button", "default", "OK").OnEvent("Click", ProcessUserInput)
MyGui.OnEvent("Close", ProcessUserInput)
MyGui.Show()

ProcessUserInput(*)
{
    Saved := MyGui.Submit()  ; Save the contents of named controls into an object.
    arrowkey := ""
    Loop{
        Sleep(5)
        if (GetKeystate("Left") = 1)
        {
            arrowkey := "left"
            break
        }
    Send(Saved.FirstName)
    Sleep(5)   
    Send "{enter}"

    }
}