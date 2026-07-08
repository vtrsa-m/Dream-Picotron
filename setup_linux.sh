#!/bin/bash

echo "=== Configurando Ambiente ==="

BINARIO="./linux/dream" 

if [ ! -f "$BINARIO" ]; then
    echo "Erro: O executável '$BINARIO' não foi encontrado."
    exit 1
fi

chmod +x "$BINARIO"

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    echo "aplicando compatibilidade para SDL2..."
    export SDL_VIDEODRIVER=wayland
fi

echo "=== A iniciar o jogo ==="
$BINARIO