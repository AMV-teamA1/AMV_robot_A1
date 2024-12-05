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

TowerStack

Go Retract_Safe

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

