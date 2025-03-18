#include <WiFi.h>
#include <WebSocketsServer_Generic.h>
#include <HardwareSerial.h>
#include <ObjectDetection_inferencing.h>
#include "edge-impulse-sdk/dsp/image/image.hpp"
#include "esp_camera.h"

const char* ssid = "Barcala 2.4G";         // Cambia por el nombre de tu red WiFi
const char* password = "barcala2024";  // Cambia por la contraseña de tu WiFi
IPAddress local_IP(10, 0, 22, 73);     // IP fija que quieras usar
IPAddress gateway(10, 0, 22, 1);       // Gateway de tu router
IPAddress subnet(255, 255, 255, 0);    // Máscara de subred

// Configuración de UART
HardwareSerial mySerial(1);
char figura = 0;
// WebSocket
WebSocketsServer webSocket = WebSocketsServer(81);  // WebSocket en puerto 81

// Configuración de la cámara
#define LED_PIN 4
#define CAMERA_MODEL_AI_THINKER // Has PSRAM
#if defined(CAMERA_MODEL_AI_THINKER)
#define PWDN_GPIO_NUM     32
#define RESET_GPIO_NUM    -1
#define XCLK_GPIO_NUM      0
#define SIOD_GPIO_NUM     26
#define SIOC_GPIO_NUM     27

#define Y9_GPIO_NUM       35
#define Y8_GPIO_NUM       34
#define Y7_GPIO_NUM       39
#define Y6_GPIO_NUM       36
#define Y5_GPIO_NUM       21
#define Y4_GPIO_NUM       19
#define Y3_GPIO_NUM       18
#define Y2_GPIO_NUM        5
#define VSYNC_GPIO_NUM    25
#define HREF_GPIO_NUM     23
#define PCLK_GPIO_NUM     22
#endif

/* Constant defines -------------------------------------------------------- */
#define EI_CAMERA_RAW_FRAME_BUFFER_COLS           320
#define EI_CAMERA_RAW_FRAME_BUFFER_ROWS           240
#define EI_CAMERA_FRAME_BYTE_SIZE                 3

/* Private variables ------------------------------------------------------- */
static bool debug_nn = false; // Set this to true to see e.g. features generated from the raw signal
static bool is_initialised = false;
uint8_t *snapshot_buf; //points to the output of the capture

static camera_config_t camera_config = {
    .pin_pwdn = PWDN_GPIO_NUM,
    .pin_reset = RESET_GPIO_NUM,
    .pin_xclk = XCLK_GPIO_NUM,
    .pin_sscb_sda = SIOD_GPIO_NUM,
    .pin_sscb_scl = SIOC_GPIO_NUM,

    .pin_d7 = Y9_GPIO_NUM,
    .pin_d6 = Y8_GPIO_NUM,
    .pin_d5 = Y7_GPIO_NUM,
    .pin_d4 = Y6_GPIO_NUM,
    .pin_d3 = Y5_GPIO_NUM,
    .pin_d2 = Y4_GPIO_NUM,
    .pin_d1 = Y3_GPIO_NUM,
    .pin_d0 = Y2_GPIO_NUM,
    .pin_vsync = VSYNC_GPIO_NUM,
    .pin_href = HREF_GPIO_NUM,
    .pin_pclk = PCLK_GPIO_NUM,

    //XCLK 20MHz or 10MHz for OV2640 double FPS (Experimental)
    .xclk_freq_hz = 20000000,
    .ledc_timer = LEDC_TIMER_0,
    .ledc_channel = LEDC_CHANNEL_0,

    .pixel_format = PIXFORMAT_JPEG, //YUV422,GRAYSCALE,RGB565,JPEG
    .frame_size = FRAMESIZE_QVGA,    //QQVGA-UXGA Do not use sizes above QVGA when not JPEG

    .jpeg_quality = 12, //0-63 lower number means higher quality
    .fb_count = 1,       //if more than one, i2s runs in continuous mode. Use only with JPEG
    .fb_location = CAMERA_FB_IN_PSRAM,
    .grab_mode = CAMERA_GRAB_WHEN_EMPTY,
};

/* Function definitions ------------------------------------------------------- */
bool ei_camera_init(void);
void ei_camera_deinit(void);
bool ei_camera_capture(uint32_t img_width, uint32_t img_height, uint8_t *out_buf);
int ei_camera_get_data(size_t offset, size_t length, float *out_ptr);
void enviarDibujo(char figura);
void enviarJuego(char accion);
void enviarDibujoTablero(char figura, char posX, char posY);
/**
 * @brief      Arduino setup function
 */
void setup() {
    mySerial.begin(9600, SERIAL_8N1, 3, 1); // Inicializar UART

    // Configurar IP estática antes de conectar al WiFi
    if (!WiFi.config(local_IP, gateway, subnet)) {
        //Serial.println("Error al configurar IP estática");
    }

    pinMode(LED_PIN, OUTPUT);
    digitalWrite(LED_PIN, LOW);

    // Conectar a WiFi
    WiFi.begin(ssid, password);
    //Serial.print("Conectando a WiFi");
    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        //Serial.print(".");
    }
    //Serial.println("");
    //Serial.println("WiFi conectado");
    //Serial.println("Dirección IP: ");
    //Serial.println(WiFi.localIP());

    // Iniciar WebSocket
    webSocket.begin();
    webSocket.onEvent(webSocketEvent);
    //Serial.println("Servidor WebSocket iniciado");

    // Inicializar la cámara
    if (ei_camera_init() == false) {
        ei_printf("Failed to initialize Camera!\r\n");
    } else {
        ei_printf("Camera initialized\r\n");
    }
}

/**
 * @brief      Arduino loop function
 */
void loop() {
    webSocket.loop(); // Manejar eventos del WebSocket

    // Verificar si hay datos disponibles en el puerto serial
    if (mySerial.available()) {
        char receivedChar = mySerial.read();

        if (receivedChar == 'F') {
            webSocket.broadcastTXT("dibujo_completado");
        }
        else if (receivedChar == 'W') {
            
            webSocket.broadcastTXT("gano_robot");
        }
        else if (receivedChar == 'T') {
            
            webSocket.broadcastTXT("empate");
        }
        else if (receivedChar == 'L') {
            
            webSocket.broadcastTXT("gano_jugador");
        }
        // Si es un dígito del 1 al 9, lo reenvía directamente
        else if (receivedChar >= '0' && receivedChar <= '8') {
            String message(receivedChar);  // Convierte el char a String para broadcastTXT
            webSocket.broadcastTXT(message);
        }
    }

    delay(1000);
}

// Function to create and send a drawing command string
void enviarDibujo(char figura) {
    String command = ".*D" + String(figura) + "*.";
    mySerial.print(command);
}

// Function to create and send a game command string (draw board or clear board)
void enviarJuego(char accion) {
    String command = ".*J" + String(accion) + "*.";
    mySerial.print(command);
}

// Function to create and send a drawing command string with position on the board
void enviarDibujoTablero(char figura, char posX, char posY) {
    String command = ".*JD" + String(figura) + String(posX) + String(posY) + "*.";
    delay(50);
    mySerial.print(command);
}

// Function to create and send a drawing command string with position on the board
void enviarJugada(char figura, char posX, char posY) {
    String command = ".*JP" + String(figura) + String(posX) + String(posY) + "*.";
    delay(50);
    mySerial.print(command);
}

/**
 * @brief      WebSocket event handler
 */
void webSocketEvent(uint8_t num, WStype_t type, uint8_t *payload, size_t length) {
    switch (type) {
        case WStype_DISCONNECTED:
            //Serial.printf("[%u] ¡Desconectado!\n", num);
            break;

        case WStype_CONNECTED:
            {
                //Serial.printf("[%u] ¡Cliente conectado!\n", num);
            }
            break;

        case WStype_TEXT:
            {
                String mensaje = String((char*)payload);
                //Serial.printf("[%u] Texto recibido: %s\n", num, mensaje.c_str());
                if (mensaje == "circulo") {
                    enviarDibujo('O'); // Enviar el dibujo al robot
                } else if (mensaje == "cuadrado") {
                    enviarDibujo('C'); // Enviar el dibujo al robot
                } else if (mensaje == "triangulo") {
                    enviarDibujo('T'); // Enviar el dibujo al robot
                } else if (mensaje == "cruz") {
                    enviarDibujo('X'); // Enviar el dibujo al robot
                } else if (mensaje == "estrella") {
                    enviarDibujo('S'); // Enviar el dibujo al robot
                } else if (mensaje == "corazon") {
                    enviarDibujo('H'); // Enviar el dibujo al robot
                } else if (mensaje == "replicar") {
                    figura = reconocerFigura(); // Llamar a la función de reconocimiento
                    enviarDibujo(figura); // Enviar el dibujo al robot
                } else if (mensaje == "tablero") {
                    enviarJuego('T'); // Enviar el comando para dibujar el tablero
                } else if (mensaje == "finalizar") {
                    enviarJuego('L'); // Enviar el comando para dibujar el tablero
                } else if (mensaje.startsWith("tateti-")) {
                    char posX = mensaje.charAt(7); // Obtener la posición X
                    char posY = mensaje.charAt(9); // Obtener la posición Y
                    enviarDibujoTablero('O', posX, posY); // Enviar el dibujo al robot
                } else {
                    //Serial.println("Comando no reconocido"); 
                }
                //Serial.println(mySerial.read());
                //Serial.println(figura);
            }
            break;
    }
}

/**
 * @brief      Recognize the figure from the camera
 *
 * @return     The recognized figure as a char ('X', 'T', 'C', 'O', or 'M' if no figure is detected)
 */
char reconocerFigura() {
    char figuraDetectada = 'M'; // Por defecto, devuelve 'M' si no se detecta nada

    // Variables to store the results of 10 iterations
    int counts[4] = {0}; // Counts for each figure (X, T, C, O)
    float precision[4] = {0.0}; // Sum of precision for each figure

    digitalWrite(LED_PIN, HIGH);

    for (int i = 0; i < 15; i++) {
        // instead of wait_ms, we'll wait on the signal, this allows threads to cancel us...
        if (ei_sleep(5) != EI_IMPULSE_OK) {
            return figuraDetectada;
        }

        snapshot_buf = (uint8_t*)malloc(EI_CAMERA_RAW_FRAME_BUFFER_COLS * EI_CAMERA_RAW_FRAME_BUFFER_ROWS * EI_CAMERA_FRAME_BYTE_SIZE);

        // check if allocation was successful
        if (snapshot_buf == nullptr) {
            ei_printf("ERR: Failed to allocate snapshot buffer!\n");
            digitalWrite(LED_PIN, LOW);
            return figuraDetectada;
        }

        ei::signal_t signal;
        signal.total_length = EI_CLASSIFIER_INPUT_WIDTH * EI_CLASSIFIER_INPUT_HEIGHT;
        signal.get_data = &ei_camera_get_data;

        if (ei_camera_capture((size_t)EI_CLASSIFIER_INPUT_WIDTH, (size_t)EI_CLASSIFIER_INPUT_HEIGHT, snapshot_buf) == false) {
            ei_printf("Failed to capture image\r\n");
            free(snapshot_buf);
            digitalWrite(LED_PIN, LOW);
            return figuraDetectada;
        }

        // Run the classifier
        ei_impulse_result_t result = {0};

        EI_IMPULSE_ERROR err = run_classifier(&signal, &result, debug_nn);
        if (err != EI_IMPULSE_OK) {
            ei_printf("ERR: Failed to run classifier (%d)\n", err);
            digitalWrite(LED_PIN, LOW);
            return figuraDetectada;
        }

        if( i == 0){
          free(snapshot_buf);
          continue;
        }

        // Print the bounding boxes for debugging
        ei_printf("Object detection bounding boxes:\r\n");
        if (result.bounding_boxes_count == 0) {
            ei_printf("  No figure detected\r\n");
        } else {
            // Find the figure with the highest precision in this iteration
            int max_index = -1;
            float max_value = 0.0;
            for (uint32_t j = 0; j < result.bounding_boxes_count; j++) {
                ei_impulse_result_bounding_box_t bb = result.bounding_boxes[j];
                if (bb.value <= 0.6) {
                    continue;
                }
                ei_printf("  %s (%f) [ x: %u, y: %u, width: %u, height: %u ]\r\n",
                          bb.label,
                          bb.value,
                          bb.x,
                          bb.y,
                          bb.width,
                          bb.height);

                // Track the figure with the highest precision
                if (bb.value > max_value) {
                    max_value = bb.value;
                    max_index = j;
                }
            }

            // Update counts and precision for the figure with the highest precision
            if (max_index != -1) {
                ei_impulse_result_bounding_box_t bb = result.bounding_boxes[max_index];
                if (strcmp(bb.label, "X") == 0) {
                    counts[0]++;
                    precision[0] += bb.value;
                } else if (strcmp(bb.label, "T") == 0) {
                    counts[1]++;
                    precision[1] += bb.value;
                } else if (strcmp(bb.label, "C") == 0) {
                    counts[2]++;
                    precision[2] += bb.value;
                } else if (strcmp(bb.label, "O") == 0) {
                    counts[3]++;
                    precision[3] += bb.value;
                }
            }
        }

        free(snapshot_buf);
    }

    digitalWrite(LED_PIN, LOW);
    // Calculate the figure with the highest count and its average precision
    int max_count_index = -1;
    int max_count = 0;
    for (int i = 0; i < 4; i++) {
        if (counts[i] > max_count) {
            max_count = counts[i];
            max_count_index = i;
        }
    }

    const char* figures[] = {"X", "T", "C", "O"};

    // Determine the final result
    if (max_count_index == -1 || max_count == 0) {
        ei_printf("Final Result:\n");
        ei_printf("  No figure detected in any iteration.\n");
        figuraDetectada = 'M'; // No se detectó ninguna figura
    } else {
        float average_precision = precision[max_count_index] / counts[max_count_index];
        ei_printf("Final Result:\n");
        ei_printf("  Figure: %s\n", figures[max_count_index]);
        ei_printf("  Count: %d\n", counts[max_count_index]);
        ei_printf("  Average Precision: %.5f\n", average_precision);

        // Asignar la figura detectada
        figuraDetectada = figures[max_count_index][0];
       
        if (figuraDetectada == 'C') {
          webSocket.broadcastTXT("cuadrado");
        } else if (figuraDetectada == 'X'){
          webSocket.broadcastTXT("cruz");
        } else if (figuraDetectada == 'O'){
          webSocket.broadcastTXT("circulo");
       } else if (figuraDetectada == 'T'){
          webSocket.broadcastTXT("triangulo");
       } else { 
          webSocket.broadcastTXT("figura no reconocida");
        }
    }

    return figuraDetectada;
}

/**
 * @brief   Setup image sensor & start streaming
 *
 * @retval  false if initialisation failed
 */
bool ei_camera_init(void) {
    if (is_initialised) return true;

#if defined(CAMERA_MODEL_ESP_EYE)
    pinMode(13, INPUT_PULLUP);
    pinMode(14, INPUT_PULLUP);
#endif

    //initialize the camera
    esp_err_t err = esp_camera_init(&camera_config);
    if (err != ESP_OK) {
        Serial.printf("Camera init failed with error 0x%x\n", err);
        return false;
    }

    sensor_t *s = esp_camera_sensor_get();
    // initial sensors are flipped vertically and colors are a bit saturated
    if (s->id.PID == OV3660_PID) {
        s->set_vflip(s, 1); // flip it back
        s->set_brightness(s, 1); // up the brightness just a bit
        s->set_saturation(s, 0); // lower the saturation
    }

#if defined(CAMERA_MODEL_M5STACK_WIDE)
    s->set_vflip(s, 1);
    s->set_hmirror(s, 1);
#elif defined(CAMERA_MODEL_ESP_EYE)
    s->set_vflip(s, 1);
    s->set_hmirror(s, 1);
    s->set_awb_gain(s, 1);
#endif

    is_initialised = true;
    return true;
}

/**
 * @brief      Stop streaming of sensor data
 */
void ei_camera_deinit(void) {
    //deinitialize the camera
    esp_err_t err = esp_camera_deinit();
    if (err != ESP_OK) {
        ei_printf("Camera deinit failed\n");
        return;
    }
    is_initialised = false;
    return;
}

/**
 * @brief      Capture, rescale and crop image
 *
 * @param[in]  img_width     width of output image
 * @param[in]  img_height    height of output image
 * @param[in]  out_buf       pointer to store output image, NULL may be used
 *                           if ei_camera_frame_buffer is to be used for capture and resize/cropping.
 *
 * @retval     false if not initialised, image captured, rescaled or cropped failed
 *
 */
bool ei_camera_capture(uint32_t img_width, uint32_t img_height, uint8_t *out_buf) {
    bool do_resize = false;

    if (!is_initialised) {
        ei_printf("ERR: Camera is not initialized\r\n");
        return false;
    }

    camera_fb_t *fb = esp_camera_fb_get();

    if (!fb) {
        ei_printf("Camera capture failed\n");
        return false;
    }

    bool converted = fmt2rgb888(fb->buf, fb->len, PIXFORMAT_JPEG, snapshot_buf);

    esp_camera_fb_return(fb);

    if (!converted) {
        ei_printf("Conversion failed\n");
        return false;
    }

    if ((img_width != EI_CAMERA_RAW_FRAME_BUFFER_COLS) || (img_height != EI_CAMERA_RAW_FRAME_BUFFER_ROWS)) {
        do_resize = true;
    }

    if (do_resize) {
        ei::image::processing::crop_and_interpolate_rgb888(
            out_buf,
            EI_CAMERA_RAW_FRAME_BUFFER_COLS,
            EI_CAMERA_RAW_FRAME_BUFFER_ROWS,
            out_buf,
            img_width,
            img_height);
    }

    return true;
}
 int ei_camera_get_data(size_t offset, size_t length, float *out_ptr) {
    // we already have a RGB888 buffer, so recalculate offset into pixel index
    size_t pixel_ix = offset * 3;
    size_t pixels_left = length;
    size_t out_ptr_ix = 0;

    while (pixels_left != 0) {
        // Swap BGR to RGB here
        // due to https://github.com/espressif/esp32-camera/issues/379
        out_ptr[out_ptr_ix] = (snapshot_buf[pixel_ix + 2] << 16) + (snapshot_buf[pixel_ix + 1] << 8) + snapshot_buf[pixel_ix];

        // go to the next pixel
        out_ptr_ix++;
        pixel_ix += 3;
        pixels_left--;
    }
    // and done!
    return 0;
}

#if !defined(EI_CLASSIFIER_SENSOR) || EI_CLASSIFIER_SENSOR != EI_CLASSIFIER_SENSOR_CAMERA
#error "Invalid model for current sensor"
#endif
