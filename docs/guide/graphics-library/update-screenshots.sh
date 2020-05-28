#!/bin/sh

"$SHOT" ./graphics-screen.xodball screen-canvas ./canvas-node.png 150

"$SHOT" ./graphics-screen.xodball screen-render ./render-node.png 150

"$SHOT" ./graphics-screen.xodball screen-point ./point-node.png 250
"$SHOT" ./graphics-screen.xodball screen-line ./line-node.png 250

"$SHOT" ./graphics-screen.xodball screen-rect-outline ./rect-outline-node.png 250
"$SHOT" ./graphics-screen.xodball screen-rect-solid ./rect-solid-node.png 250

"$SHOT" ./graphics-screen.xodball screen-circle-outline ./circle-outline-node.png 250
"$SHOT" ./graphics-screen.xodball screen-circle-solid ./circle-solid-node.png 250

"$SHOT" ./graphics-screen.xodball screen-triangle-outline ./triangle-outline-node.png 250
"$SHOT" ./graphics-screen.xodball screen-triangle-solid ./triangle-solid-node.png 250

"$SHOT" ./graphics-screen.xodball screen-text ./text-node.png 250
