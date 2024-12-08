Integer Tokens
Integer Blocks
Double TokenHeight
Double BlockHeight
'----------------
Integer ndisk, diskheight(3)
'---------------
Function main

Motor On
Power High
Speed 30
Accel 30, 30
SpeedS 500
AccelS 5000
' Tool 1

'-----------------
ndisk = 3
diskheight(1) = ndisk
diskheight(2) = 0
diskheight(3) = 0
'------------------
Print "disk height"
Print diskheight(1)
Print diskheight(2)
Print diskheight(3)
'------------------
Go Retract_Safe
hanoi(ndisk)
Go Retract_Safe
'------------------
Print "disk height"
Print diskheight(1)
Print diskheight(2)
Print diskheight(3)
'------------------
Fend

Function hanoi(n As Integer)
	Integer i, j, k
	Integer count, id
	Boolean flag1, flag2, flag3, flag4
	Integer n1, n2
	count = 1
	For i = 1 To n
		count = count * 2
	Next
	'-------------
	Integer loc(100)
	For i = 1 To n
		loc(i) = 1
	Next
	For i = 1 To count - 1
		j = 1
		k = i
		Do While ((k Mod 2) = 0)
			j = j + 1
			k = k /2
		Loop
		' set boolean condition
		flag1 = ((n + 1 - j) Mod 2) = 1
		flag2 = (((k + 1) / 2) Mod 3) = 1
		flag3 = ((n + 1 - j) Mod 2) = 0
		flag4 = (((k + 1) / 2) Mod 3) = 2
		id = n + 1 - (n + 1 - j)
		' decide move
		If ((((k + 1) / 2) Mod 3) = 0) Then
			n1 = loc(id)
			n2 = 1
			moveDisk(n1, n2)
			loc(id) = 1
		ElseIf ((flag1 And flag2) Or (flag3 And flag4)) Then
			n1 = loc(id)
			n2 = 2
			moveDisk(n1, n2)
			loc(id) = 2
		Else
			n1 = loc(id)
			n2 = 3
			moveDisk(n1, n2)
			loc(id) = 3
		EndIf
		Print "--------"
	Next
	Print count
Fend
Function moveDisk(n1 As Integer, n2 As Integer)
TokenHeight = 6.0
BlockHeight = 6.0

Print "from"
Print n1
Print "to"
Print n2
' pick token
If n1 = 1 Then
	Go Tray_Token1 +Z(100) CP
	Move Tray_token1 +Z(diskheight(n1) * TokenHeight)
	On 8
	Wait .5
	Go Tray_Token1 +Z(100) CP
EndIf
If n1 = 2 Then
	Go Tray_Token2 +Z(100) CP
	Move Tray_token2 +Z(diskheight(n1) * TokenHeight)
	On 8
	Wait .5
	Go Tray_Token2 +Z(100) CP
EndIf
If n1 = 3 Then
	Go Tray_Token3 +Z(100) CP
	Move Tray_token3 +Z(diskheight(n1) * TokenHeight)
	On 8
	Wait .5
	Go Tray_Token3 +Z(100) CP
EndIf
' put token
If n2 = 1 Then
	Go Tray_Token1 +Z(100) CP
	Move Tray_token1 +Z(diskheight(n2) * TokenHeight)
	Off 8
	Wait .5
	Go Tray_Token1 +Z(100) CP
EndIf
If n2 = 2 Then
	Go Tray_Token2 +Z(100) CP
	Move Tray_token2 +Z(diskheight(n2) * TokenHeight)
	Off 8
	Wait .5
	Go Tray_Token2 +Z(100) CP
EndIf
If n2 = 3 Then
	Go Tray_Token3 +Z(100) CP
	Move Tray_token3 +Z(diskheight(n2) * TokenHeight)
	Off 8
	Wait .5
	Go Tray_Token3 +Z(100) CP
EndIf



diskheight(n1) = diskheight(n1) - 1
diskheight(n2) = diskheight(n2) + 1
	
Fend


