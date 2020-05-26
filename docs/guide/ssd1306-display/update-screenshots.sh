#!/bin/sh

"$SHOT" ./ssd1306-screen.xodball quickstart-node ./quickstart-node.png 150
"$SHOT" ./ssd1306-screen.xodball quickstart-example ./quickstart-example.png 350
"$SHOT" ./ssd1306-screen.xodball quickstart-example-with-nodes ./quickstart-example-with-nodes.png 550

"$SHOT" ./ssd1306-screen.xodball advanced-device-node ./advanced-device-node.png 150
"$SHOT" ./ssd1306-screen.xodball render-node ./render-node.png 150
"$SHOT" ./ssd1306-screen.xodball render-daisy-chain ./render-daisy-chain.png 350
