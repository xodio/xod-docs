#!/usr/bin/env bash

SRC=example.xodball

$SHOT $SRC no-buses ./no-buses.patch.png 500
$SHOT $SRC with-buses ./with-buses.patch.png 700
