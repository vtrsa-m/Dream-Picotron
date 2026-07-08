@echo off

echo "=== Configurando Ambiente ==="

set PASTA_WINDOWS=windows
set BINARIO=dream.exe

if not exist "%PASTA_WINDOWS%" (
    echo [ERRO] A pasta %PASTA_WINDOWS% nao foi encontrada.
    pause
    exit /b
)

cd "%PASTA_WINDOWS%"

if not exist "%BINARIO%" (
    echo [ERRO] O executavel %BINARIO% nao foi encontrado na pasta windows.
    pause
    exit /b
)

echo "=== Iniciando o jogo ==="
start "" "%BINARIO%"