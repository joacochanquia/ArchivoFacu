// Basically all HTML here (including js if needed)

#include <arduino.h>   // for PROGMEM...

const char MAIN_page[] PROGMEM = R"=====(
<html>
  <HEAD>
     <TITLE>Ej WiFi-HTTP 03</TITLE>
     <meta name='viewport' content='user-scalable=no'/>
  </HEAD>

<body>

<CENTER>
<p style='font-size:60px'> "Hello from Esp AP/HTTP Server (Clase)!" </p>
</CENTER>

</body>
</html>
)=====";
