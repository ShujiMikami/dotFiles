# ! /usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"


TWELITE_MODEL="${1:-BLUE}"

case "$TWELITE_MODEL" in 
	BLUE|RED)
		;;
	*)
		echo "Usage: $0 [BLUE|RED]"
		exit 1
		;;
esac

cd "$PROJECT_ROOT/build"

make "TWELITE=$TWELITE_MODEL"
