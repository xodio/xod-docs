#!/bin/sh

DIR=$(dirname $0)
XODBALL=$DIR/example.xodball

"$SHOT" "$XODBALL" logging "$DIR/logging.patch.png"
