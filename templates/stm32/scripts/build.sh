#! /usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

BUILD_TYPE="${1:-Debug}"

case "$BUILD_TYPE" in 
	Debug|Release)
		;;
	*)
		echo "Usage: $0 [Debug|Release]"
		exit 1
		;;
esac

cd "$PROJECT_ROOT"

cmake --preset "$BUILD_TYPE" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

cmake --build --preset "$BUILD_TYPE"
