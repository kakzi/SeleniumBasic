
' ---------------------------------------------------------------------------------------
' Set Firefox to automatically download files without popup to a target folder
' ---------------------------------------------------------------------------------------

Class Script
    Dim driver

    Sub Class_Initialize
        folder = Replace(WScript.ScriptFullName, WScript.ScriptName, "") & "firefox_download"
        
        Set driver = CreateObject("Selenium.FirefoxDriver")
        driver.SetPreference "pdfjs.disabled", True
        driver.SetPreference "browser.download.dir", folder
        driver.SetPreference "browser.download.folderList", 2
        driver.SetPreference "browser.helperApps.neverAsk.saveToDisk", "application/pdf"
        
        driver.Get "http://static.mozilla.com"
        driver.Get "/moco/en-US/pdf/mozilla_privacypolicy.pdf"
        
        WScript.Echo "Click OK to close the browser"
    End Sub

    Sub Class_Terminate
        driver.Quit
    End Sub
End Class

Set s = New Script