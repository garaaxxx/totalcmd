if 1 = mount
  Run "%ProgramFiles%\Truecrypt\truecrypt.exe" /q /l y /v "%A_MyDocuments%\Dropbox\safe.tc"  
else if 1 = dismount
  Run "%ProgramFiles%\Truecrypt\truecrypt.exe"  /q /dismount y
else
Msgbox,,Usage:,
(
%A_ScriptName% <option>
options are "mount" and "dismount"
)
Exit
