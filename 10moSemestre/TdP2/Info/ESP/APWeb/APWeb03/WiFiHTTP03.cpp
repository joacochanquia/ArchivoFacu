#include "WiFiHTTP03.h"
#include "index.h"

#ifdef ESP32                       // Board: ESP32 Dev Module
  #include <WebServer.h>
  WebServer server(80);
#elif defined(ESP8266)             // Board: NodeMCU 1.0 (ESP-12E Module) o LOLIN(WEMOS) D1 R2 & Mini
  #include <ESP8266WebServer.h>
  ESP8266WebServer server(80);
#else
  #error "Placa no soportada, usar ESP8266 o ESP32"
#endif

const char* ssid = "Clase";
const char* password = "12345678";

/************************************************************/
void handleRoot() 
{
  String s = MAIN_page; 
  server.send(200, "text/html", s);
}

/************************************************************/
void handleNotFound() 
{
  String message = "File Not Found\n\n";
  server.send(404, "text/plain", message);
}

/************************************************************/
void WiFiHTTP03_init() 
{
  Serial.println();
  Serial.println("Configuring access point: 'Clase'(Id) - '12345678'(key)...");

  IPAddress Ip(10, 10, 10, 10);       // Config Interface
  IPAddress NMask(255, 255, 255, 0);
  WiFi.softAPConfig(Ip, Ip, NMask);
  
  WiFi.mode(WIFI_AP);
  WiFi.softAP(ssid, password);

  Serial.println("Use 10.10.10.10 as HTTP Server IP...");

  server.begin();

  server.on("/", handleRoot);

  server.onNotFound(handleNotFound);

  server.begin();
}

/************************************************************/
void WiFiHTTP03_handleReq()
{
  server.handleClient();
  delay(2);//allow the cpu to switch to other tasks
}
/************************************************************/






