#include <Arduino_FreeRTOS.h>
#include <semphr.h>

// Declaramos los semáforos
SemaphoreHandle_t semaforoTarea1;
SemaphoreHandle_t semaforoTarea2;
SemaphoreHandle_t semaforoTarea3;

// Tarea 1
void tarea1(void *pvParameters) {
  while (1) {
    // Esperamos el semáforo de la tarea 1
    xSemaphoreTake(semaforoTarea1, portMAX_DELAY);
    Serial.println("Tarea 1\n\r");
    // Damos el semáforo para la tarea 2
    xSemaphoreGive(semaforoTarea2);
    vTaskDelay(500 / portTICK_PERIOD_MS);  // Añadimos un pequeño delay
  }
}

// Tarea 2
void tarea2(void *pvParameters) {
  while (1) {
    // Esperamos el semáforo de la tarea 2
    xSemaphoreTake(semaforoTarea2, portMAX_DELAY);
    Serial.println("Tarea 2\n\r");
    // Damos el semáforo para la tarea 3
    xSemaphoreGive(semaforoTarea3);
    vTaskDelay(500 / portTICK_PERIOD_MS);  // Añadimos un pequeño delay
  }
}

// Tarea 3
void tarea3(void *pvParameters) {
  while (1) {
    static int count = 3;
    // Esperamos el semáforo de la tarea 3
    xSemaphoreTake(semaforoTarea3, portMAX_DELAY);
    Serial.println("Tarea 3\n\r");
    count--;
    if (count){
      // Damos el semáforo para la tarea 3
      xSemaphoreGive(semaforoTarea3);
    }else{
      count = 3;
      // Damos el semáforo para la tarea 1
      xSemaphoreGive(semaforoTarea1);
    }
    vTaskDelay(500 / portTICK_PERIOD_MS);  // Añadimos un pequeño delay
  }
}

void setup() {
  Serial.begin(9600);

  // Creamos los semáforos
  semaforoTarea1 = xSemaphoreCreateBinary();
  semaforoTarea2 = xSemaphoreCreateBinary();
  semaforoTarea3 = xSemaphoreCreateBinary();

  // Creamos las tareas
  xTaskCreate(tarea1, "Tarea 1", 128, NULL, 1, NULL);
  xTaskCreate(tarea2, "Tarea 2", 128, NULL, 1, NULL);
  xTaskCreate(tarea3, "Tarea 3", 128, NULL, 1, NULL);

  // Inicializamos la secuencia dando el semáforo de la Tarea 1
  xSemaphoreGive(semaforoTarea3);
}

void loop() {
  // El loop se queda vacío, ya que FreeRTOS maneja las tareas
}