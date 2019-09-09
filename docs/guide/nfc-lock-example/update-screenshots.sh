#!/bin/sh

"$SHOT" ./example.xodball 1-scan-nfc ./1-scan-nfc.patch.png
"$SHOT" ./example.xodball 2-key-token ./2-key-token.patch.png
"$SHOT" ./example.xodball 3-validate-uid ./3-validate-uid.patch.png
"$SHOT" ./example.xodball 4-relay ./4-relay.patch.png
"$SHOT" ./example.xodball 5-lcd ./5-lcd.patch.png
"$SHOT" ./example.xodball 6-overrun ./6-overrun.patch.png
"$SHOT" ./example.xodball 7-done ./7-done.patch.png
"$SHOT" ./example.xodball 8-multiple ./8-multiple.patch.png
