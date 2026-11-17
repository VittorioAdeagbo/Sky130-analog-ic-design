#!/bin/bash

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$PROJECT_ROOT/scripts/setup_pdk.sh" || exit 1

XSCHEM_RC="$PDK_ROOT/$PDK/libs.tech/xschem/xschemrc"

if [[ ! -f "$XSCHEM_RC" ]]; then
    echo "ERROR: Xschem configuration not found:"
    echo "$XSCHEM_RC"
    exit 1
fi

if [[ -z "$1" ]]; then
    echo "Usage: ./scripts/run_xschem.sh <schematic-file>"
    exit 1
fi

SCHEMATIC="$PROJECT_ROOT/$1"

if [[ ! -f "$SCHEMATIC" ]]; then
    echo "ERROR: Schematic file not found: $SCHEMATIC"
    exit 1
fi

xschem --rcfile "$XSCHEM_RC" "$SCHEMATIC"
