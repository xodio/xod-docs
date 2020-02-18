#!/bin/sh

SRC=examples.xodball

"$SHOT" "$SRC" 01-fill-solid ./01-fill-solid.patch.png
"$SHOT" "$SRC" 02-tweak-color ./02-tweak-color.patch.png
"$SHOT" "$SRC" 03-fill-pattern ./03-fill-pattern.patch.png
"$SHOT" "$SRC" 04-animate-hue ./04-animate-hue.patch.png
"$SHOT" "$SRC" 05-animate-pattern ./05-animate-pattern.patch.png
"$SHOT" "$SRC" 06-animate-pot-01 ./06-animate-pot-01.patch.png
"$SHOT" "$SRC" 06-animate-pot-02 ./06-animate-pot-02.patch.png
"$SHOT" "$SRC" 06-animate-pot-03 ./06-animate-pot-03.patch.png
