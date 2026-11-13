' Declaración de variables globales (mejor práctica ponerlas al inicio)
Global Double TokenHeight
Global Double BlockHeight

Function main
    Motor On
    Power High
    Speed 30
    Accel 30, 30
    SpeedS 500
    AccelS 5000
    Tool 1

    Integer TokenID
    Integer BlockID
    Integer TotalTokens
    Integer TotalBlocks
    
    TotalTokens = 2
    TotalBlocks = 2
    TokenHeight = 6.0
    BlockHeight = 6.0

    Go Retract_Safe

    ' Bucle de Tokens usando paso por parámetro
    For TokenID = TotalTokens To 0 Step -1
        Call Pick_Infeed_Token(TokenID)
        Call Alignment_Token(TokenID)
        Call Place_Tray_Token(TokenID)
    Next TokenID

    ' Bucle de Blocks
    For BlockID = TotalBlocks To 0 Step -1
        Call Pick_Infeed_Block(BlockID)
        Call Alignment_Block(BlockID)
        Call Place_Tray_Block(BlockID)
    Next BlockID

    Go Retract_Safe
Fend

' --- FUNCIONES DE TOKENS ---

Function Pick_Infeed_Token(id As Integer)
    Print "Picking Token from Infeed. Token ID = ", id
    
    Go Infeed_Token -Z(50 + (id * TokenHeight)) /2 CP
    Move Infeed_Token -Z(id * TokenHeight)
    On 8
    Wait 0.5
    Move Infeed_Token +X(-1) -Z(80 + (id * TokenHeight)) CP
Fend

Function Alignment_Token(id As Integer)
    Print "Aligning Token. Token ID = ", id
    
    Go Align_Token -Z(20) CP
    Move Align_Token
    Off 8
    Move Align_Token +X(5)
    Move Align_Token +X(5) +Z(5) CP
    Go Align_Token -Z(5) CP
    Move Align_Token
    On 8
    Wait 0.5
    Move Align_Token -Z(20) CP
Fend

Function Place_Tray_Token(id As Integer)
    Print "Placing Token in Tray. Tray Position ID = ", id
    
    ' NOTA: Revisa el -0.05. Si son milímetros, esto es casi nada. ¿Querías poner -50?
    Go Tray_Token +X(-0.05 * id) +Y(30.0 * id) -Z(80) CP
    Move Tray_Token +X(-0.05 * id) +Y(30.0 * id)
    Off 8
    Wait 0.5
    Move Tray_Token +Y(30.0 * id) +X(-0.05 * id) -Z(80) CP
Fend

' --- FUNCIONES DE BLOCKS ---

Function Pick_Infeed_Block(id As Integer)
    Print "Picking Block from Infeed. Block ID = ", id
    
    Go Infeed_Block -Z(50 + (id * BlockHeight)) CP
    Move Infeed_Block -Z(id * BlockHeight)
    On 8
    Wait 0.5
    Move Infeed_Block +X(-1) +Y(1) -Z(80 + (id * BlockHeight)) CP
Fend

Function Alignment_Block(id As Integer)
    Print "Aligning Block. Block ID = ", id
    
    Go Align_Block -Z(20) CP
    Move Align_Block
    Off 8
    Move Align_Block +Y(-5)
    Move Align_Block +X(5) +Y(6) CP
    Move Align_Block +X(5) +Y(6) -Z(5) CP
    Go Align_Block -Z(5) CP
    Move Align_Block
    On 8
    Wait 0.5
    Move Align_Block -Z(20) CP
Fend

Function Place_Tray_Block(id As Integer)
    Print "Placing Block in Tray. Block Position ID = ", id
    
    Go Tray_Block +Y(30.0 * id) +X(0.05 * id) -Z(50) CP
    Move Tray_Block +Y(30.0 * id) +X(0.05 * id)
    Off 8
    Wait 0.5
    Move Tray_Block +Y(30.0 * id) +X(0.05 * id) -Z(80) CP
Fend
