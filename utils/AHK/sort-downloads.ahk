; Dateien nach Erweiterung sortieren
#SingleInstance
#NoEnv  
;#Include X:\Eigene Dateien\Code\AHK\lib\Array.ahk
SetWorkingDir %A_ScriptDir%


; really sort?
Msgbox,68,Bitte bestätigen,Soll %A_WorkingDir% wirklich sortiert werden?
Ifmsgbox No
  ExitApp
Else
  SortFiles()

If %ErrorLevel%
    Msgbox,,,something went wrong  
ExitApp



SortFiles() {

; Audio:
folderAudio = Audio

if not InStr(FileExist(folderAudio), "D") 
  FileCreateDir, %folderAudio% 
  
FileMove, *.mp3, %folderAudio% 
FileMove, *.ogg, %folderAudio% 
FileMove, *.wav, %folderAudio% 
FileMove, *.flac, %folderAudio% 
FileMove, *.amr, %folderAudio% 
FileMove, *.mid, %folderAudio% 
FileMove, *.pls, %folderAudio% 
FileMove, *.m3u, %folderAudio% 
FileMove, *.wma, %folderAudio% 

; Images
folderImage = Bilder

if not InStr(FileExist(folderImage), "D") 
  FileCreateDir, %folderImage% 
  
FileMove, *.jpg, %folderImage% 
FileMove, *.jpeg, %folderImage% 
FileMove, *.png, %folderImage% 
FileMove, *.gif, %folderImage% 
FileMove, *.psd, %folderImage% 
FileMove, *.pdn, %folderImage% 
FileMove, *.bmp, %folderImage% 
FileMove, *.tif, %folderImage% 

; Videos
folderVideo = Videos

if not InStr(FileExist(folderVideo), "D") 
  FileCreateDir, %folderVideo% 
  
FileMove, *.avi, %folderVideo% 
FileMove, *.mpg, %folderVideo% 
FileMove, *.mpeg, %folderVideo% 
FileMove, *.wmv, %folderVideo% 
FileMove, *.mp4, %folderVideo% 
FileMove, *.flv, %folderVideo% 
FileMove, *.3gp, %folderVideo% 
FileMove, *.mkv, %folderVideo% 
FileMove, *.mov, %folderVideo% 
FileMove, *.m4v, %folderVideo% 

; Program Files
folderProgram = Setup

if not InStr(FileExist(folderProgram), "D") 
  FileCreateDir, %folderProgram% 
  
FileMove, *.exe, %folderProgram% 
FileMove, *.msi, %folderProgram% 
FileMove, *.jar, %folderProgram% 
FileMove, *.air, %folderProgram% 
FileMove, *.bat, %folderProgram% 

; Documents
folderDoc = Dokumente

if not InStr(FileExist(folderDoc), "D") 
  FileCreateDir, %folderDoc% 
  
FileMove, *.txt, %folderDoc% 
FileMove, *.pdf, %folderDoc% 
FileMove, *.rtf, %folderDoc% 
FileMove, *.doc, %folderDoc% 
FileMove, *.docx, %folderDoc% 
FileMove, *.xls, %folderDoc% 
FileMove, *.odb, %folderDoc% 
FileMove, *.ods, %folderDoc% 
FileMove, *.odt, %folderDoc% 
FileMove, *.sxw, %folderDoc% 
FileMove, *.nfo, %folderDoc% 
FileMove, *.hlp, %folderDoc% 
FileMove, *.chm, %folderDoc% 

; Archives
folderArchive = Archive

if not InStr(FileExist(folderArchive), "D") 
  FileCreateDir, %folderArchive% 
 
FileMove, *.zip, %folderArchive% 
FileMove, *.rar, %folderArchive% 
FileMove, *.7z, %folderArchive% 
FileMove, *.bz2, %folderArchive% 
FileMove, *.cab, %folderArchive% 
FileMove, *.gz, %folderArchive% 

; The Rest
folderOther = MISC
if not InStr(FileExist(folderOther), "D") 
  FileCreateDir, %folderOther%  


; only move files not matching the other types to folderOther
; files that could not be moved (file already existing) are kept   
Loop, %A_WorkingDir%\* 
{
If A_LoopFilename not contains .zip,.rar,.7z,.bz2,.cab,.gz
                              ,.mp3,.ogg,.wav,.flac,.amr,.mid,.pls,.m3u,.wma
                              ,.jpg,.jpeg,.png,.gif,.psd,.pdn,.bmp,.tif
                              ,.avi,.mpg,.mpeg,.wmv,.mp4,.flv,.3gp,.mkv,.mov,.m4v
                              ,.exe,.msi,.jar,.air,.bat
                              ,.txt,.pdf,.rtf,.doc,.docx,.xls,.odb,.ods,.odt,.sxw,.nfo,.hlp,.chm
  FileMove, %A_LoopFilename%, %folderOther% 
}

; do not move the scriptfile itself
FileMove, %folderOther%\%A_ScriptName%, %A_WorkingDir%

; http://www.autohotkey.com/board/topic/75847-solvedcopying-files-recurse-into-subfolders-not-working/#entry482420
; http://www.autohotkey.com/board/topic/33305-multiple-extensions-easy/#entry212311
; http://www.autohotkey.com/board/topic/45876-ahk-l-arrays/
; http://l.autohotkey.net/docs/Objects.htm

files := Array()

Loop, %A_WorkingDir%\*
	files.append(A_LoopFileName)    
duplicates := files.sort().join("`n")
  
; nur zeigen wenn fiels-array > 2

Msgbox,,,Dateien bereits vorhanden:`n`n%duplicates%
; Msgbox, % files.sort().join("`n")
   
   
; overwrite

; rename

; skip  
  
 


Msgbox,,,done. 

}


