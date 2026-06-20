#!/usr/bin/env bash

set -e

: "${MWSDK_ROOT:?MWSDK_ROOT is not set}"
: "${TWELITE_DEVICE:?TWELITE_DEVICE is not set}"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd $PROJECT_ROOT

BIN=$(ls -t build/*.bin | head -1)

sudo kextunload -b com.FTDI.driver.FTDIUSBSerialDriver

cleanup() {
  sudo kextload -b com.FTDI.driver.FTDIUSBSerialDriver
}
trap cleanup EXIT

python $MWSDK_ROOT/../Tools/tweprog_py/tweterm.py -p $TWELITE_DEVICE -F $BIN  --debug --no-term

