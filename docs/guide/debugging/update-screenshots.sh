#!/bin/sh

SRC=examples.xodball

"$SHOT" "$SRC" simulation ./simulation.patch.png 450
"$SHOT" "$SRC" on-board ./on-board.patch.png 350
