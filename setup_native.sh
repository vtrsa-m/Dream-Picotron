#!/bin/bash

# Setup - Versão Nativa (Executável Linux)

echo "=== Configurando Ambiente: Versão Nativa Linux ==="

BINARIO="./bin/jogo_linux" 

if [ ! -f "$BINARIO" ]; then
    echo "Erro: O executável '$BINARIO' não foi encontrado."
    echo "Certifique-se de que exportou o jogo no Picotron para a pasta correta."
    exit 1
fi

echo "A garantir permissões de execução para o binário..."
chmod +x "$BINARIO"

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    echo "[Ambiente Wayland Detetado] A aplicar variáveis de compatibilidade para SDL2..."
    export SDL_VIDEODRIVER=wayland
fi

echo "=== A iniciar o jogo ==="
echo "=========================================="
$BINARIO
echo "=========================================="
echo "Processo encerrado."