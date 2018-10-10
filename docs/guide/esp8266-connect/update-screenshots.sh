#!/bin/sh

SRC=esp8266-native-wifi.xodball

"$SHOT" "$SRC" 1-connect-node ./1-connect-node.patch.png 200
"$SHOT" "$SRC" 2-connecting-to-wifi ./2-connecting-to-wifi.patch.png 600
