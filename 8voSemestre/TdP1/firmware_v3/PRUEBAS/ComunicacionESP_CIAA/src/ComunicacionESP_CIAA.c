/*=============================================================================
 * Author: joaquin
 * Date: 2024/12/02
 * Version: 1
 *===========================================================================*/

/*=====[Inclusions of function dependencies]=================================*/

#include "ComunicacionESP_CIAA.h"
#include "sapi.h" // <= sAPI header
#include <string.h>

// Buffer para almacenar la figura recibida
#define BUFFER_SIZE 50
char figuraRecibida[BUFFER_SIZE];
int index = 0;

int main(void) {
   // Inicializar la placa
   boardConfig();
   
   
   // Inicializar la UART
   uartConfig(UART_232, 115200); // Comunicación UART con la ESP32
   uartConfig(UART_USB, 9600); // Comunicación DEBUG

   // Configurar los LEDs como salida
   gpioConfig(LED1, GPIO_OUTPUT);
   gpioConfig(LED2, GPIO_OUTPUT);
   gpioConfig(LED3, GPIO_OUTPUT);
   gpioConfig(LEDB, GPIO_OUTPUT);

   // Apagar todos los LEDs al inicio
   gpioWrite(LED1, OFF);
   gpioWrite(LED2, OFF);
   gpioWrite(LED3, OFF);
   gpioWrite(LEDB, OFF);
   gpioWrite(LEDR, OFF);
   gpioWrite(LEDG, ON);

   while (1) {
      char receivedChar;

      uartWriteString(UART_USB, "ESPERANDO A RECIBIR... ");
      // Si hay datos disponibles en la UART_232
      if (uartReadByte(UART_232, (uint8_t*)&receivedChar)) {
         gpioWrite(LEDG, OFF);
         uartWriteString(UART_USB, "Recibido de ESP: ");
         switch (receivedChar) {
            case 'X':
              gpioWrite(LED1, HIGH); // Encender LED1
              break;
            case 'C':
              gpioWrite(LED2, HIGH); // Encender LED2
              break;
            case 'O':
              gpioWrite(LED3, HIGH); // Encender LED3
              break;
            case 'T':
              gpioWrite(LEDB, HIGH); // Encender LED4
              break;
            default:
              gpioWrite(LED1, HIGH); // Encender LED1
              gpioWrite(LED2, HIGH); // Encender LED2
              gpioWrite(LED3, OFF);
              gpioWrite(LEDR, HIGH); // Encender LED4
              break;
         }
         uartWriteByte(UART_USB, receivedChar);
         delay (200);
         gpioWrite(LED1, OFF);
         gpioWrite(LED2, OFF);
         gpioWrite(LED3, OFF);
         gpioWrite(LEDB, OFF);
         gpioWrite(LEDR, OFF);
         gpioWrite(LEDG, ON);
         
      }
      delay(200);
   }

   return 0;
}