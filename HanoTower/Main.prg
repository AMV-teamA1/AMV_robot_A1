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
Tool 1


'Pick
'TowerStack

'================
' hanoi
'================
'-----------------
ndisk = 5
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

Go Retract_Safe

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
	Move Tray_token1 +Z((diskheight(n1) - 1) * TokenHeight)
	On 8
	Wait .5
	Go Tray_Token1 +Z(100) CP
EndIf
If n1 = 2 Then
	Go Tray_Token2 +Z(100) CP
	Move Tray_token2 +Z((diskheight(n1) - 1) * TokenHeight)
	On 8
	Wait .5
	Go Tray_Token2 +Z(100) CP
EndIf
If n1 = 3 Then
	Go Tray_Token3 +Z(100) CP
	Move Tray_token3 +Z((diskheight(n1) - 1) * TokenHeight)
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


Function Pick
Tokens = 2
Blocks = 2
TokenHeight = 6.0
BlockHeight = 6.0
Integer TokenID
Integer BlockID

Go Retract_Safe

For TokenID = Tokens To 0 Step -1
	Pick_Infeed_Token()
	Alignment_Token()
	If TokenID = 2 Then
		Go Tray_Token1 +Z(20) CP
		Move Tray_Token1
		Off 8
		Wait .5
		Move Tray_Token1 +Z(50) CP
	EndIf
	If TokenID = 1 Then
		Go Tray_Token2 +Z(20) CP
		Move Tray_Token2
		Off 8
		Wait .5
		Move Tray_Token2 +Z(50) CP
	
	EndIf
	If TokenID = 0 Then
		Go Tray_Token3 +Z(20) CP
		Move Tray_Token3
		Off 8
		Wait .5
		Move Tray_Token3 +Z(50) CP
	EndIf
Next TokenID


For BlockID = Blocks To 0 Step -1
	Pick_Infeed_Block()
	Alignment_Block()
	If BlockID = 2 Then
		Go Tray_Block1 +Z(20) CP
		Move Tray_Block1
		Off 8
		Wait .5
		Move Tray_Block1 +Z(50) CP
	EndIf
	If BlockID = 1 Then
		Go Tray_Block2 +Z(20) CP
		Move Tray_Block2
		Off 8
		Wait .5
		Move Tray_Block2 +Z(50) CP
	
	EndIf
	If BlockID = 0 Then
		Go Tray_Block3 +Z(20) CP
		Move Tray_Block3
		Off 8
		Wait .5
		Move Tray_Block3 +Z(50) CP
	EndIf
Next BlockID
	
Fend
'----------------------	
Function TowerStack

Tokens = 10
Blocks = 10
TokenHeight = 6.0
BlockHeight = 6.0
Integer TokenID
Integer BlockID

TokenID = Tokens - 1
BlockID = Blocks - 1
Real TowerHeight
TowerHeight = -1 * TokenHeight
Integer ID

For ID = Tokens To 1 Step -1
'Pick Block from Infeed
	Go Infeed_Block +Z(80 + (BlockID * BlockHeight)) CP
	Move Infeed_Block +Z(BlockID * BlockHeight)
	Print("Block Pick from ")
	Print (BlockID)
	On 8
	Wait .5
    Move Infeed_Block +X(-1) +Z(150 + (BlockID * BlockHeight)) CP
	
	BlockID = BlockID - 1
	TowerHeight = TowerHeight + BlockHeight
	Print("Go to Tower with Height of")
	Print (TowerHeight)

'-----------------------
'Alignment Blcok
	Go Align_Block +Z(150) CP
	Move Align_Block +X(-6) +Y(6) +Z(TowerHeight)
	Off 8
	Wait .5
	Go Align_Block +X(-6) +Y(6) +Z(150) CP

'----------------------	
	Go Infeed_Token +Z(80 + (TokenID * TokenHeight)) CP
	Move Infeed_Token +Z(TokenID * TokenHeight)
	Print("Token Pick from ")
	Print (TokenID)
	On 8
	Wait .5
	Move Infeed_Token +X(-1) +Z(80 + (TokenID * TokenHeight)) CP
	TokenID = TokenID - 1
	TowerHeight = TowerHeight + TokenHeight
	Print("Go to Tower with Height of")
	Print (TowerHeight)
'-----------------------
	Go Align_Block +X(-6) +Y(6) +Z(150) CP
	Move Align_Block +X(-6) +Y(6) +Z(TowerHeight)
	Off 8
	Wait .5
	Go Align_Block +Z(150) CP
'------------------------
	

Next ID
	
Fend

Function Pick_Infeed_Token
	'Pick Token from Infeed
	Print "Picking Token from Infeed. Token ID = ", Tokens
	Go Infeed_Token +Z(50 + (Tokens * TokenHeight)) CP
	Move Infeed_Token +Z(Tokens * TokenHeight)
	On 8
	Wait .5
	Move Infeed_Token +X(-1) +Z(50 + (Tokens * TokenHeight)) CP
	Tokens = Tokens - 1
Fend

Function Pick_Infeed_Block
	'Pick Block from Infeed
	Print "Picking Block from Infeed. Block ID = ", Blocks
	Go Infeed_Block +Z(50 + (Blocks * BlockHeight)) CP
	Move Infeed_Block +Z(Blocks * BlockHeight)
	On 8
	Wait .5
	Move Infeed_Block +X(-1) +Y(1) +Z(50 + (Blocks * BlockHeight)) CP
	Blocks = Blocks - 1
Fend

Function Alignment_Token
	'Alignment Token
	Print "Aligning Token. Token ID = ", Tokens
	Go Align_Token +Z(20) CP
	Move Align_Token
	Off 8
	Move Align_Token +X(5)
	Move Align_Token +X(5) +Z(5) CP
	Go Align_Token +Z(5) CP
	Move Align_Token
	On 8
	Wait .5
	Move Align_Token +Z(20) CP
Fend

Function Alignment_Block
	'Alignment Block
	Print "Aligning Block. Block ID = ", Blocks
	Go Align_Block +Z(20) CP
	Move Align_Block
	Off 8
	Move Align_Block +Y(-5)
	Move Align_Block +X(5) +Y(-6) CP
	Move Align_Block +X(5) +Y(-6) +Z(5) CP
	Go Align_Block +Z(5) CP
	Move Align_Block
	On 8
	Wait .5
	Move Align_Block +Z(20) CP
Fend

Function Place_Tray_Token
	'Tray Token
'	Print "Placing Token in Tray. Tray Position ID = ", Tokens
'	Go Tray_Token +X(-.05 * Tokens) +Y(-30. * Tokens) +Z(20) CP
'	Move Tray_Token +X(-.05 * Tokens) +Y(-30. * Tokens)
'	Off 8
'	Wait .5
'	Move Tray_Token +X(-.05 * Tokens) +Y(-30. * Tokens) +Z(50) CP
'	Tokens = Tokens - 1
Fend

Function Place_Tray_Block
	'Tray Block
'	Print "Placing Block in Tray. Block Position ID = ", Blocks
'	Go Tray_Block +X(-.05 * Blocks) +Y(-30. * Blocks) +Z(20) CP
'	Move Tray_Block +X(-.05 * Blocks) +Y(-30. * Blocks)
'	Off 8
'	Wait .5
'	Move Tray_Block +X(-.05 * Blocks) +Y(-30. * Blocks) +Z(50) CP
'	Blocks = Blocks - 1
Fend

