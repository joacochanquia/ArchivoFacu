// Handles WiFi configuration as well as HTTP requests
#include "WiFiHTTP03.h"

/************************************************************/
void setup(void) 
{
  Serial.begin(115200);

  WiFiHTTP03_init();
}

/************************************************************/
void loop(void) 
{
  // Sync requests handling, now from WiFiHTTP03.h
  WiFiHTTP03_handleReq();
}
/************************************************************/




