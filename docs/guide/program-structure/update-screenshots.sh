#!/bin/sh

SRC=examples.xodball

"$SHOT" "$SRC" example ./example.patch.png 480
"$SHOT" "$SRC" nodes ./nodes-inputs-outputs.png 480
