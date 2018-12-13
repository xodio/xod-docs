#!/bin/sh

DIR=$(dirname $0)
XODBALL=$DIR/i2c-examples.xodball

"$SHOT" "$XODBALL" i2c-object "$DIR/i2c-object.patch.png" 300
"$SHOT" "$XODBALL" write-rtc-no-buses "$DIR/write-rtc-no-buses.patch.png" 650
"$SHOT" "$XODBALL" write-rtc "$DIR/write-rtc.patch.png" 850
"$SHOT" "$XODBALL" write-rtc-err "$DIR/write-rtc-err.patch.png" 1150
"$SHOT" "$XODBALL" read-rtc "$DIR/read-rtc.patch.png" 650
"$SHOT" "$XODBALL" read-rtc-err "$DIR/read-rtc-err.patch.png" 1050
