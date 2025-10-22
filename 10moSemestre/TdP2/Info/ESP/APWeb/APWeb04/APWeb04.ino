// Handles WiFi configuration as well as HTTP requests
#include "WiFiHTTP04.h"

/************************************************************/
void setup(void) 
{
  Serial.begin(115200);

  WiFiHTTP04_init();
}

String fromreq;

/************************************************************/
void loop(void) 
{ 
  // Sync requests handling, now from WiFiHTTP04.h
  fromreq = WiFiHTTP04_handleReq();

  // Request processing according to fromreq content
}
/************************************************************/

