#!/usr/bin/env bash

$SHOT ./rtc-example-screenshot.xodball rtc-example-write-step-1 ./rtc-example-write.step1.patch.png 350
$SHOT ./rtc-example-screenshot.xodball rtc-example-write-step-2 ./rtc-example-write.step2.patch.png 350

$SHOT ./rtc-example-screenshot.xodball rtc-example-read-step-1 ./rtc-example-read.step1.patch.png 250
$SHOT ./rtc-example-screenshot.xodball rtc-example-read-step-2 ./rtc-example-read.step2.patch.png 350
$SHOT ./rtc-example-screenshot.xodball rtc-example-read-step-3 ./rtc-example-read.step3.patch.png 600

$SHOT ./rtc-example-screenshot.xodball format-time-step-1 ./format-time-step-1.patch.png 600
$SHOT ./rtc-example-screenshot.xodball format-time ./format-time.patch.png 600

$SHOT ./rtc-example-screenshot.xodball format-weekday ./format-weekday.patch.png 350
$SHOT ./rtc-example-screenshot.xodball format-date ./format-date.patch.png 600
