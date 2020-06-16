        ORG 8000H


        MVI A,00001011B
INF:    

        LXI H,8400H
1K:     MOV M,C
        CALL CIN 
        INX H
        MOV A,H
        CPI 10001000B
        JNZ 1K 

        JMP 0000H

COUT:   PUSH B
        PUSH H
        DI
        XRA A
        MVI B,11D

CO1:    MVI A,80H
        RAR
        SIM

        LHLD BITTIME
CO2:    DCR L
        JNZ CO2
        DCR H
        JNZ CO2

        STC
        MOV A,C
        RAR
        MOV C,A
        DCR B
        JNZ CO1

        POP H
        POP B
        EI
        RET


CIN:    PUSH H
        DI
        MVI B,9D

CI1:    RIM
        ORA A
        JM CI1

        LHLD HALFBIT
CI2:    DCR L
        JNZ CI2
        DCR H
        JNZ CI2

CI3:    LHLD BITTIME
CI4:    DCR L
        JNZ CI4
        DCR H
        JNZ CI4
        RIM
        RAL
        DCR B
        JZ CI5

        MOV A,C
        RAR
        MOV C,A
        NOP
        JMP CI3

CI5:    POP H
        EI
        RET


BITTIME:DW 0112H
HALFBIT:DW 0109H

        END