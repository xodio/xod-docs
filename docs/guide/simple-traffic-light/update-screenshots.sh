#!/bin/sh
SRC=traffic-light-simple.xodball

"$SHOT" "$SRC" empty-state ./state-1.patch.png 540
"$SHOT" "$SRC" state-green ./state-2.patch.png 540
"$SHOT" "$SRC" main-1 ./main-1.patch.png 540
"$SHOT" "$SRC" main-2 ./main-2.patch.png 540
"$SHOT" "$SRC" main-3 ./main-3.patch.png 540
"$SHOT" "$SRC" main-fin ./main-4.patch.png 540
