#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include WinClipAPI.ahk
#Include WinClip.ahk

; Version 2
; Ctrl + Shift + V
; Find the "Comment" image in FB and click it, then paste an image into the comment box
; "Comment" and "Write a comment..." box must both be visible on the screen to work

+^v::
	CoordMode, Pixel, Window
	CoordMode, Mouse, Window
	WinGetPos, winX, winY, winWidth, winHeight, A
	ImageSearch, foundX, foundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransBlack *100 commenticon.png
	if (ErrorLevel = 2)
   		MsgBox Could not conduct the search. 
	else if (ErrorLevel = 1)
   		MsgBox Image could not be found on the screen.
	else
   		MouseClick, Left, foundX, foundY
   		WinClip.Clear()
		WinClip.SetBitmap("pic.png")
		WinClip.Paste()
return

; Ctrl + Alt + V 
; Paste coronavirus PSA when declining posts 

;!^v::
;	Send, https://www.facebook.com/groups/gmymu/permalink/3023347851060699/
;	Sleep, 10
;return
