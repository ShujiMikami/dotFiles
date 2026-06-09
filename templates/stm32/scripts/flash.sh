#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

BUILD_TYPE="${1:-Debug}"

"$SCRIPT_DIR/build.sh" "$BUILD_TYPE"

cd "$PROJECT_ROOT"

ELF_FILE=$(find build -name "*.elf" | head -n 1)

STM32_Programmer_CLI --connect port=SWD --download "$ELF_FILE" --start

echo "Flash complete."
