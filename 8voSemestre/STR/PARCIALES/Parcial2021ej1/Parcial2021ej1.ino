#include <Arduino_FreeRTOS.h>
#include <semphr.h>

SemaphoreHandle_t sem;

int var;

void tarea1(void *pvParameters){
  while (1){
    if (xSemaphoreTake(sem, portMAX_DELAY) == pdTRUE){
      var += 100;
      xSemaphoreGive(sem);
    }
    vTaskDelay(100 / portTICK_PERIOD_MS);
  }

}

void tarea2(void *pvParameters){
  int id = *(int *) pvParameters;
  while (1){
    if (xSemaphoreTake(sem, portMAX_DELAY) == pdTRUE){
      Serial.print(id);
      Serial.print(" ");
      Serial.println(var);
      var += 2;
      xSemaphoreGive(sem);
    }
    vTaskDelay(50 / portTICK_PERIOD_MS);
  }

}
void setup() {
  
  Serial.begin(9600);
  int numT2 = 2;
  int numT3 = 3;
  
  sem = xSemaphoreCreateBinary();

  xTaskCreate(tarea1, "Tarea 1", 128, NULL, 2, NULL);
  xTaskCreate(tarea2, "Tarea 2", 128, &numT2, 1, NULL);
  xTaskCreate(tarea2, "Tarea 3", 128, &numT3, 1, NULL);

  var == 0;

  xSemaphoreGive(sem);

  vTaskStartScheduler();

}

void loop() {
  // put your main code here, to run repeatedly:

}
