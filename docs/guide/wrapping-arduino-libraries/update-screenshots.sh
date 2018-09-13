#!/usr/bin/env bash

$SHOT ./pn532-nfc.xodball init ./init.patch.png 300
$SHOT ./pn532-nfc.xodball pair-tag ./pair-tag.patch.png 300
$SHOT ./pn532-nfc.xodball nfc-uid ./nfc-uid.patch.png 300
$SHOT ./pn532-nfc.xodball "equal(nfc-uid)" ./equal-nfc-uid.patch.png 300
$SHOT ./pn532-nfc.xodball example-uid-equals ./example-uid-eq.patch.png 600
$SHOT ./pn532-nfc.xodball nfc-scanner ./nfc-scanner.patch.png 770
$SHOT ./pn532-nfc.xodball example-nfc-scanner ./example-nfc-scanner.patch.png 550
