#include "WiFiHTTP04.h"
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

String req; 

/************************************************************/
void handleRoot() 
{
  String s = MAIN_page; 
  server.send(200, "text/html", s);

  // Not necessarilly after replying... depends on app.
  if (server.args() > 0)
    req = server.arg(0);
}

/************************************************************/
void handleNotFound() 
{
  String message = "File Not Found\n\n";
  server.send(404, "text/plain", message);
}

/************************************************************/
void WiFiHTTP04_init() 
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
String WiFiHTTP04_handleReq()
{
  req = "";
  server.handleClient();
  delay(2);//allow the cpu to switch to other tasks

  // At least some HTTP requests could be used for user interaction...
  return req;
}
/************************************************************/
