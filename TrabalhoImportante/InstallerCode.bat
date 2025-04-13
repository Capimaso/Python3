	@echo off
title Instalador do MateQuiz
::Disclaimer: Grande parte desse código foi feito por IA, apenas ajustes e correçao de problemas feitos por mim.

::Deleta Python da MicrosoftStore
echo Verificando a existencia de Python da MicrosoftStore...
powershell -Command "Get-AppxPackage *Python* | Remove-AppxPackage"
cls
:: Cria pasta para o jogo
set "folderName=MatQuiz"
mkdir "%~dp0%folderName%"
cd "%~dp0%folderName%"

echo Baixando Python...
curl -o python-installer.exe https://www.python.org/ftp/python/3.12.2/python-3.12.2-amd64.exe

echo Instalando Python...
python-installer.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

where python >nul 2>nul
if errorlevel 1 (
    echo Erro: Python nao foi instalado corretamente.
    exit /b
)
cls
echo Instalando Nuitka...
python -m pip install --upgrade pip
python -m pip install nuitka
cls
echo Baixando codigo...
curl -o matequiz.py https://raw.githubusercontent.com/Capimaso/Python3/main/TrabalhoImportante/main.py
cls
echo Baixando icone
curl -o matequiz.ico https://raw.githubusercontent.com/Capimaso/Python3/main/TrabalhoImportante/matequizicon.ico
cls
echo Compilando com aplicativo...
python -m nuitka --onefile --windows-console-mode=force --assume-yes-for-downloads --windows-icon-from-ico=matequiz.ico matequiz.py
cls
echo Limpando arquivos temporarios...
del matequiz.py
del python-installer.exe
del matequiz.ico
start matequiz.exe
echo Instalacao concluida com sucesso!
pause
exit