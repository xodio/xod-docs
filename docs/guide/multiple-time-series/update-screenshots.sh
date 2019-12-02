#!/bin/sh

DIR=$(dirname $0)
XODBALL=$DIR/example.xodball

"$SHOT" "$XODBALL" multiple-time-series "$DIR/multiple-time-series.patch.png"
