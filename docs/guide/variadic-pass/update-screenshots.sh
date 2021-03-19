#!/bin/sh

"$SHOT" ./variadic-pass-example.xodball step-1 ./step-1.patch.png 400
"$SHOT" ./variadic-pass-example.xodball step-1-expanded ./step-1-expanded.patch.png 400
"$SHOT" ./variadic-pass-example.xodball average ./average.patch.png 400
