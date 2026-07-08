#!/bin/bash

echo "=== Configurando Ambiente ==="

if ! command -v python3 &> /dev/null; then
    echo "Dependência ausente: Python3 não encontrado."
    echo "A tentar instalar via gestor de pacotes (requer privilégios sudo)..."
    sudo apt-get update && sudo apt-get install -y python3
else
    echo "[OK] Python3 já está instalado no sistema."
fi

PORTA=8000
ARQUIVO_JOGO="jogo.html" 

echo "Iniciando o servidor local na porta $PORTA..."
python3 -m http.server $PORTA &
PID_SERVER=$!

sleep 2

echo "=== Ambiente pronto para testes ==="
if command -v xdg-open &> /dev/null; then
    xdg-open "http://localhost:$PORTA/$ARQUIVO_JOGO"
else
    echo "Por favor, abra o seu navegador e acesse: http://localhost:$PORTA/$ARQUIVO_JOGO"
fi

echo "O jogo está a rodar! Pressione [CTRL+C] para encerrar o servidor local."

trap "echo 'A fechar o servidor...'; kill $PID_SERVER; exit" INT TERM
wait