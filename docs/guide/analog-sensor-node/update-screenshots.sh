#!/bin/sh

"$SHOT" ./sharp-irm.step1.xodball main ./step1.patch.png 660
"$SHOT" ./sharp-irm.step2.xodball gp2y0a02-range-meter ./step2a.patch.png 720
# ./step2b.gif — can't autogenerate
"$SHOT" ./sharp-irm.step3.xodball gp2y0a02-range-meter ./step3a.patch.png 820
"$SHOT" ./sharp-irm.step3.xodball main ./step3b.patch.png 240
