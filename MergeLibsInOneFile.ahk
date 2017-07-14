#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

FileEncoding, UTF-8
FileToCreate:="AHK_v2_Func.ahk"
DisclaimerFile:="README.md"

IfNotExist, % DisclaimerFile
{
msgbox Please provide the disclaimer file %DisclaimerFile%
exitapp}

IfExist, % FileToCreate
	FileDelete, % FileToCreate
FileRead, READMEContent, % DisclaimerFile
FileAppend, % "/*`n", % FileToCreate
FileAppend, % READMEContent . "`n", % FileToCreate
FileAppend, % "*/`n`n", % FileToCreate
Loop, Files, Lib\* 
	{
	FileRead, FileContent, % A_LoopFileFullPath
	FileAppend, % FileContent . "`n`n", % FileToCreate
	; FileAppend, % "`n", % FileToCreate
	}
msgbox Files were merged into 1 ahk lib !
exitapp
