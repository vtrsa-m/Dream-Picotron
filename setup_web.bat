@echo off

echo "=== Configurando Ambiente ==="

set ARQUIVO_JOGO=dream.html

if not exist "%ARQUIVO_JOGO%" (
    echo [ERRO] O arquivo %ARQUIVO_JOGO% nao foi encontrado nesta pasta.
    pause
    exit /b
)

echo Abrindo o jogo no navegador padrao...
start %ARQUIVO_JOGO%

echo Pronto! Pode fechar esta janela.
timeout /t 3 >nul