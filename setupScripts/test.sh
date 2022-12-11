#!/bin/bash
#SCRIPT_DIR=$(cd $(dirname $0) && pwd)
#SCRIPT_DIR="$(command dirname -- "${0}")" 
#SCRIPT_DIR=$(cd $(dirname $BASH_SOURCE) && pwd)
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}) && pwd)
echo $SCRIPT_DIR
