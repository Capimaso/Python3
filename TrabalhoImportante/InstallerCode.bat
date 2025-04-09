::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCqDJHGAtGcoPB5GQgu+f0i1Arwb5/vH3/OTqkITaMMqdI6b/rWAKeUf63nUbIIl2XQJpP8eDRlZchqkRwIkpnxWt2qRMvuRshvkW12A/EIzFGs6jmDf7A==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCqDJHGAtGcoPB5GQgu+f0i1Arwb5/vH3/OTqkITaMMqdI6b/rWAKeUf63nUbIIl2XQJpP8eDRlZchqkRwIkpnxWt2qRMvuxshvke12A/GI+CHF1i2/VnmU+eNYI
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
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