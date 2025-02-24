// Incluimos la libreria Arduino FreeRTOS
#include <Arduino_FreeRTOS.h>

//Declaración de las tareas
void Task1(void *pvParameters);
void Task2(void *pvParameters);
void Task3(void *pvParameters);

//Código de arranque
void setup() {
  //Frecuencia de transmisión UART
  Serial.begin(9600);
  Serial.println("Comienza el programa");

  // Crear las tres tareas
  xTaskCreate(Task1, "Tarea 1", 128, NULL, 1, NULL);
  xTaskCreate(Task2, "Tarea 2", 128, NULL, 2, NULL);
  xTaskCreate(Task3, "Tarea 3", 128, NULL, 3, NULL);
  
  vTaskStartScheduler();
}

//Loop infinito
void loop() {

}

//Definición de las tres tareas
void Task1(void *pvParameters) {
  while(true) {
    Serial.println("Tarea 1 \n\r");
    vTaskDelay(1000 / portTICK_PERIOD_MS); // Espera 1 segundo
  }
}
void Task2(void *pvParameters) {
  while(true) {
    Serial.println("Tarea 2 \n\r");
    vTaskDelay(1000 / portTICK_PERIOD_MS); // Espera 1 segundo
  }
}
void Task3(void *pvParameters) {
  while(true) {
    Serial.println("Tarea 3 \n\r");
    vTaskDelay(1000 / portTICK_PERIOD_MS); // Espera 1 segundo
  }
}