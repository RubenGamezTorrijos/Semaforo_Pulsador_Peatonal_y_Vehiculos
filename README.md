# Semaforo 2 Peatonal y Vehículos + Pulsador (Prioridad Peatones)

## Descripción
Este programa implementa un semáforo para peatones y vehículos con un pulsador de llamada para peatones. Cuando se activa el pulsador, el semáforo pasa inmediatamente a la fase de prioridad para peatones, interrumpiendo el ciclo normal del semáforo.

## Detalles del Hardware
- LED para vehículos conectado al puerto B, bit 0.
- LEDs para peatones conectados al puerto D, bits 2 y 3.
- Un pulsador para llamada de peatones conectado al pin 6 del puerto D.

## Funcionamiento
El semáforo sigue un ciclo continuo a través de las cinco fases definidas. Cuando se activa el pulsador de llamada para peatones, el semáforo pasa inmediatamente a la fase 5, que otorga prioridad a los peatones. Después de completar la fase de prioridad para peatones, el semáforo continúa con el ciclo normal.

## Uso en Wokwi.com
Para utilizar este código en Wokwi.com, puedes copiar y pegar el código en un nuevo sketch en el editor de código de Wokwi. Asegúrate de seleccionar el microcontrolador ATmega328P y de conectar los LEDs y el pulsador según las especificaciones del hardware.

## Uso en Arduino Uno con IDE de Arduino
Para usar este código en Arduino Uno con el IDE de Arduino, sigue estos pasos:

1. Abre el IDE de Arduino.
2. Crea un nuevo sketch.
3. Copia y pega el código en el sketch.
4. Guarda el sketch con un nombre descriptivo, por ejemplo, "Semaforo_Pulsador.ino".
5. Conecta tu Arduino Uno a tu computadora.
6. Selecciona el tipo de placa "Arduino Uno" en el menú Herramientas > Placa.
7. Selecciona el puerto adecuado en el menú Herramientas > Puerto.
8. Verifica el código haciendo clic en el botón "Verificar" (✓).
9. Sube el código a tu Arduino haciendo clic en el botón "Subir" (➡).
10. Observa el funcionamiento del semáforo utilizando los LEDs y el pulsador conectados a tu Arduino Uno.

## Licencia
Este código está protegido por una licencia de uso personal. No se permite su reproducción o distribución sin el permiso del autor. Puedes usarlo para fines personales o educativos, pero debes reconocer al autor original.
