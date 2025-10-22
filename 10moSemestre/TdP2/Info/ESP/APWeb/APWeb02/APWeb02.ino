// Handles WiFi configuration as well as HTTP requests
#include "WiFiHTTP02.h"

/************************************************************/
void setup(void) 
{
  Serial.begin(115200);

  WiFiHTTP02_init();
}

/************************************************************/
void loop(void) 
{
  // Sync requests handling, now from WiFiHTTP02.h
  WiFiHTTP02_handleReq();
}
/************************************************************/

