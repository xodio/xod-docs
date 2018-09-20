#!/bin/sh

"$SHOT" ./uart-led-control-screenshot.xodball pots-step-1 ./pots.step1.patch.png 250
"$SHOT" ./uart-led-control-screenshot.xodball pots-step-2 ./pots.step2.patch.png 450
"$SHOT" ./uart-led-control-screenshot.xodball pots-step-3 ./pots.step3.patch.png 650
"$SHOT" ./uart-led-control-screenshot.xodball pots ./pots.patch.png 650

"$SHOT" ./uart-led-control-screenshot.xodball leds-step-1 ./leds.step1.patch.png 250
"$SHOT" ./uart-led-control-screenshot.xodball leds-step-2 ./leds.step2.patch.png 350
"$SHOT" ./uart-led-control-screenshot.xodball leds ./leds.patch.png 550

