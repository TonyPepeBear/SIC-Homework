INLOOP  TD      INDEV
        JEQ     INLOOP
        RD      INDEV
        COMP    MON
        JEQ     END
        COMP    AA
        JGT     OUTLOOP
        JSUB	MINUS
OUTLOOP TD      OUTDEV
        JEQ     OUTLOOP
        WD      OUTDEV
        J       INLOOP

MINUS   ADD     BB
        RSUB  


END     J     END

INDEV   BYTE    X'F1'
OUTDEV  BYTE    X'F2'
TEMP    WORD    0
MON     WORD    36
AA      WORD    96
BB      WORD    32

