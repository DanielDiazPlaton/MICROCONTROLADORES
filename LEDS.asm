;PROGRAMA QUE ENCIENDE ( LEDS)
;**********************************************************************************************************
;Colocamos un interruptor en RA0 profe para que de ahi se enciendan los led en el portb
;Cueando RA0 = 1 en el ppuerto B, entonces, el valor hexadecimal AA
;y cunaod RA0 = 1, el valor hexadecimal 55
;*********************************************************************************************************

    LIST p=16F887            ; MICROCONTROLADOR QUE OCUPAMOS EN CLASE
    INCLUDE P16F887.INC      ; DEFINE LOS SFRs Y DEL BITS 
    
    
    __CONFIG _CONFIG1   ;_CP_OFF&_WDT_OOF&_XT_OSC PARAMETROS DE CONFIGURACION
    
    errorlevel   -302  ; Desabilita mensajes de error o advertencia por cambio de bancos
    
;******************************************************************************************************
    ;INCIO DE PROGRAMA XD
    
    ORG 0x00  ; COMIENZA EL PROGRAMA  
    
    ; SETEO DE PUERTOS
    
    BANKSEL  TRISB  ; selecciona el banco contenido
    CLRF     TRISB   ; puerto b configurado como salida
    BANKSEL  ANSEL
    CLRF     ANSEL  ; Configura puertos con entradas digitales
    CLRF     ANSELH ; configura puertos con estradas digitales
    BANKSEL  PORTB  ; selecciona el puerto B como salida
    CLRF     PORTB  ; 
    CLRF     PORTA
    
;*******************************************************************************************************
; Desarrollo del programa
;******************************************************************************************************   
    
 LOOP 
    BTFSS  PORTA,0 ; prueba del bit 0 del puerto A
    GOTO   NUEVO_VALOR
    MOVLW  B'10101010'  ; mueve 0xAA al registro W
    MOVWF  PORTB   ; pasa el valor al PORT B
    
 NUEVO_VALOR
    MOVLW  B'01010101'  ; mueve 0x55 al registro W
    MOVWF  PORTB   ; pasa el valor al puerto B
    GOTO   LOOP
    
    
    END  ; fin del programa
    
    
    