Integer Tokens
Integer Blocks
Double TokenHeight
Double BlockHeight
Function main

Motor On
Power High
Speed 30
Accel 30, 30
SpeedS 500
AccelS 5000
Tool 1

Pick

Go Retract_Safe

Fend
Function Pick
Tokens = 2
Blocks = 2
TokenHeight = 6.0
BlockHeight = 6.0
Integer TokenID
Integer BlockID

Go Retract_Safe

'Start from the Tokens
For TokenID = Tokens To 0 Step -1
	Pick_Infeed_Token()
	Alignment_Token()
	'Place Tokens
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

'Blocks
For BlockID = Blocks To 0 Step -1
	Pick_Infeed_Block()
	Alignment_Block()
	'Place Tokens
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


