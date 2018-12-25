#!/bin/sh

SRC=examples.xodball

"$SHOT" "$SRC" to-percent ./to-percent.patch.png 500
"$SHOT" "$SRC" count ./count.patch.png 340
"$SHOT" "$SRC" test-select-4-numbers ./test-select-4-numbers.patch.png 340
