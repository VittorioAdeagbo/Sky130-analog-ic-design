#!/bin/bash

# SKY130 PDK configuration
export PDK_VERSION="0fe599b2afb6708d281543108caf8310912f54af"
export PDK_ROOT="$HOME/.volare/volare/sky130/versions/$PDK_VERSION"
export PDK="sky130A"

# Verify the installation
MODEL_LIBRARY="$PDK_ROOT/$PDK/libs.tech/ngspice/sky130.lib.spice"

if [[ ! -f "$MODEL_LIBRARY" ]]; then
    echo "ERROR: SKY130 model library not found."
    echo "Expected location: $MODEL_LIBRARY"
    return 1 2>/dev/null || exit 1
fi

echo "SKY130 PDK environment configured successfully."
echo "PDK: $PDK"
echo "Version: $PDK_VERSION"
echo "PDK_ROOT: $PDK_ROOT"
