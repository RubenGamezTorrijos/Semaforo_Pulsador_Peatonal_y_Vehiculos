;
;  Program: Semaforo_2_Pulsador.S
;  Description: Semáforo Peatonal y Vehículos con Pulsador de llamada a LED connected to the port B of the ATmega328P
;  Author: Rubén Gámez Torrijos
;  Created: 04/06/2024
;

#define __SFR_OFFSET 0
#include <avr/io.h>

.org 0
rjmp setup

setup:
.global main

main:
  ; Configura los bits 0, 1 y 2 del puerto B como salidas (LEDs Coches)
  ; Configura los bits 2 y 3 del puerto D como salidas (LEDs Peatones)
  ; Configura el bit 6 del puerto D como entrada (Pulsador)
  ldi r16, 0b00000111
  out _SFR_IO_ADDR(DDRB), r16
  ldi r16, 0b00001100
  out _SFR_IO_ADDR(DDRD), r16
  ldi r16, 0x00
  out _SFR_IO_ADDR(DDRD), r16

  ; Habilita pull-up interno para el pulsador en PD6
  ldi r16, (1 << PD6)
  out _SFR_IO_ADDR(PORTD), r16

  ; Inicializa los puertos B y D a 0
  ldi r17, 0x00
  out _SFR_IO_ADDR(PORTB), r17
  out _SFR_IO_ADDR(PORTD), r17

reset_to_fase_5:
  ; Reinicia el programa comenzando en la Fase 5 Prioridad Peatones
  rjmp fase_5

fase_5:
  ; Fase 5: Amarillo Coches y Rojo Peatones (cambio rápido)
  ldi r17, 0b00000010
  out _SFR_IO_ADDR(PORTB), r17
  ldi r18, 0b00001000
  out _SFR_IO_ADDR(PORTD), r18
  call delay_5s
  rcall check_button
  
  ; Continúa con el ciclo normal
  rjmp loop


loop:
  ; Fase 1: Rojo Coches y Verde Peatones
  ldi r17, 0b00000100
  out _SFR_IO_ADDR(PORTB), r17
  ldi r18, 0b00000100
  rcall check_button
  out _SFR_IO_ADDR(PORTD), r18
  call delay_5s
  ldi r18, 0b00000100
  rcall check_button
  out _SFR_IO_ADDR(PORTD), r18
  call delay_5s
  ldi r18, 0b00000100
  rcall check_button
  out _SFR_IO_ADDR(PORTD), r18
  call delay_5s
  rcall check_button

  ; Fase 2: Rojo Coches y Verde Peatones parpadeando a 1 segundo durante 5 segundos
  ldi r17, 0b00000100
  out _SFR_IO_ADDR(PORTB), r17
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_1s
  rcall check_button
  ldi r18, 0x00
  out _SFR_IO_ADDR(PORTD), r18
  call delay_1s
  rcall check_button
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_1s
  rcall check_button
  ldi r18, 0x00
  out _SFR_IO_ADDR(PORTD), r18
  call delay_1s
  rcall check_button
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_1s
  rcall check_button
  ldi r18, 0x00
  out _SFR_IO_ADDR(PORTD), r18
  call delay_1s
  rcall check_button
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_1s
  rcall check_button
  ldi r18, 0x00
  out _SFR_IO_ADDR(PORTD), r18
  call delay_1s
  rcall check_button
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_1s
  rcall check_button

  ; Fase 3: Amarillo Coches y Verde Peatones parpadeando a 0.5 segundos durante 5 segundos
  ldi r17, 0b00000010
  out _SFR_IO_ADDR(PORTB), r17
  rcall check_button
  ldi r18, 0b00000100
  rcall check_button
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  rcall check_button
  ldi r18, 0x00
  rcall check_button
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  rcall check_button
  ldi r18, 0b00000100
  rcall check_button
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  rcall check_button
  ldi r18, 0x00
  rcall check_button
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  rcall check_button
  ldi r18, 0b00000100
  rcall check_button
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  rcall check_button
  ldi r18, 0x00
  rcall check_button
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  rcall check_button
  ldi r18, 0b00000100
  rcall check_button
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  rcall check_button
  ldi r18, 0x00
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  rcall check_button
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  ldi r18, 0x00
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  rcall check_button
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  ldi r18, 0x00
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  rcall check_button
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  rcall check_button

  ; Fase 4: Verde Coches y Rojo Peatones
  ldi r17, 0b00000001
  out _SFR_IO_ADDR(PORTB), r17
  ldi r18, 0b00001000
  out _SFR_IO_ADDR(PORTD), r18
  call delay_5s
  rcall check_button
  ldi r18, 0b00001000
  out _SFR_IO_ADDR(PORTD), r18
  call delay_5s
  rcall check_button
  ldi r18, 0b00001000
  out _SFR_IO_ADDR(PORTD), r18
  call delay_5s
  rcall check_button

  ; Fase 5: Amarillo Coches y Rojo Peatones
  ldi r17, 0b00000010
  out _SFR_IO_ADDR(PORTB), r17
  rcall check_button
  ldi r18, 0b00001000
  out _SFR_IO_ADDR(PORTD), r18
  call delay_5s
  rcall check_button
  ldi r18, 0b00001000
  out _SFR_IO_ADDR(PORTD), r18
  call delay_5s
  rcall check_button
     
  rjmp loop

check_button:
  ; Verificación del botón (Pulsador)
  in r19, _SFR_IO_ADDR(PIND)
  sbrs r19, PD6
  rjmp reset_to_fase_5
  ret

delay_5s:
  ; Retardo de 5 segundos
  ldi  r20, 205
  ldi  r21, 51
  ldi  r22, 0
L2: dec  r22
    brne L2
    dec  r21
    brne L2
    dec  r20
    brne L2
    lpm
    nop
    ret

delay_1s:
  ; Retardo de 1 segundo
  ldi  r20, 41
  ldi  r21, 8
  ldi  r22, 0
L3: dec  r22
    brne L3
    dec  r21
    brne L3
    dec  r20
    brne L3
    lpm
    nop
    ret

delay_05s:
  ; Retardo de 0.5 segundos
  ldi  r20, 20
  ldi  r21, 4
  ldi  r22, 0
L4: dec  r22
    brne L4
    dec  r21
    brne L4
    dec  r20
    brne L4
    lpm
    nop
    ret
