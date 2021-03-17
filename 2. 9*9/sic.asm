MAIN    JSUB    FL        .PRINT FIRST LINE
        J       ILOOP


ILOOP   LDA     II      . ILOOP
        COMP    TEN
        JEQ     EXIT    . EXIT WHEN TEN
        LDA     NN      . NEW LINE
        WD      OUTDEV  
        LDA     II
        JSUB	PA      . PRINT LINE NUMBER
        LDA     ONE     . SET JJ ONE
        STA     JJ
        J       JLOOP

JLOOP   LDA     II      . JLOOP
        MUL     JJ      . I*J
        JSUB    PA      . PRINT I*J
        LDA     JJ      . ADD 1 TO JJ
        ADD     ONE
        STA     JJ
        COMP    TEN     . COMP JOOP
        JLT     JLOOP   . LOOP J
        LDA     II      . ADD I
        ADD     ONE
        STA	II
        J       ILOOP   . BACK TO JLOOP
        

PA      STA     PTMP    . PRINT A
        LDA     SPAC
        WD      OUTDEV
        WD      OUTDEV
        LDA     ZERO
        STA     PGTMP   . SET ZERO
        LDA     PTMP
        DIV     TEN
        COMP    ZERO
        JGT     PGT
        LDA     SPAC    . PRINT SPACE
        WD      OUTDEV
PCON    LDA     PTMP    . CONTINUE
        SUB     PGTMP
        ADD     FE
        WD      OUTDEV
        RSUB

PGT     STA	PGTMP   . PRINT WHEN > 10
        ADD     FE
        WD      OUTDEV
        LDA     PGTMP
        MUL     TEN
        STA     PGTMP
        J       PCON

FL      LDA     SPAC    .PRINT FIRST LINE
        WD      OUTDEV  .PRINT SPACE
        WD      OUTDEV
        WD      OUTDEV
        WD      OUTDEV
FLOOP   LDA     II
        STL     LTMP    .L TO LTMP
        JSUB	PA      .PRINT II
        LDL     LTMP
        LDA     II      .ADD I
        ADD     ONE
        STA     II
        COMP    TEN
        JLT     FLOOP   .LOOP WHEN < 10
        LDA     ONE     .II TO ONE
        STA     II
        RSUB



EXIT    J       EXIT    .EXIT

ZERO    WORD    0
ONE     WORD    1
PTMP    WORD    0
TEN     WORD    10
PGTMP   WORD    0
OUTDEV  BYTE    X'F3'
FE      WORD    48
II      WORD    1
JJ      WORD    1
NN      WORD    10
SPAC    WORD    32
LTMP    WORD    0
