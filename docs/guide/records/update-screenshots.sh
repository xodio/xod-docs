#!/bin/sh

"$SHOT" ./records.xodball 3d-acceleration ./3d-acceleration.patch.png
"$SHOT" ./records.xodball record-to-feeds ./record-to-feeds.patch.png
"$SHOT" ./records.xodball nested-records ./nested-records.patch.png
