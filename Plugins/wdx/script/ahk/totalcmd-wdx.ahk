; http://www.autohotkey.com/board/topic/24851-file-defragment-native-ahk/
#NoEnv
#NoTrayIcon
SetBatchLines,-1 
file = %1%

; find file
if FileExist(file)
{
  ; check size
  FileGetSize, fileSize, %file%
  if (fileSize < 1000000)
  {
    returnValue := countLines(file)  
  }
  else
  {
    returnValue := "---"
  }
}     
else if StrLen(file) = 0
{
  ; missing argument
  returnValue = -1
}
else
{
  ; file not found
  returnValue = -1
}
; Msgbox, (%returnValue%) %file%
FileAppend %returnValue%, *  
return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;	file functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; return number of lines
countLines(file)
{ 
Loop, read, %file%
  lineCount := A_Index  
  return lineCount
}
