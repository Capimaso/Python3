@echo off
title Instalador do MateQuiz

:: Cria pasta para o jogo na mesma pasta do BAT
set "folderName=MateQuizFolder"
mkdir "%~dp0%folderName%"
cd "%~dp0%folderName%"

echo Instalando Python...

:: Baixa o instalador mais recente do Python automaticamente
curl -o python-installer.exe https://www.python.org/ftp/python/3.12.2/python-3.12.2-amd64.exe

:: Instala silenciosamente o Python para todos os usuários, com pip e adicionando ao PATH
python-installer.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

:: Espera um pouco para garantir que o Python foi instalado
timeout /t 1 /nobreak >nul

:: Verifica se o Python está instalado
where python >nul 2>nul
if errorlevel 1 (
    echo Erro: Python nao foi instalado corretamente.
    pause
    exit /b
)

echo Criando o arquivo matequiz.py...

:: Cria o código Python com base no seu conteúdo
> matequiz.py echo # MateQuiz
>> matequiz.py echo import random
>> matequiz.py echo import time
>> matequiz.py echo import os
>> matequiz.py echo.
>> matequiz.py echo def conta():
>> matequiz.py echo.    os.system('cls')
>> matequiz.py echo.    questionValue = int(input('Quantas questoes gostaria de resolver? (Maximo 30)\n'))
>> matequiz.py echo.    for i in range(questionValue):
>> matequiz.py echo.        os.system('cls')
>> matequiz.py echo.        numero1 = random.randint(1,9)
>> matequiz.py echo.        numero2 = random.randint(1,9)
>> matequiz.py echo.        sinal = random.choice(['+','-','x','/'])
>> matequiz.py echo.        print(f"{numero1} {sinal} {numero2} = ?")
>> matequiz.py echo.        userAnswer = float(input('Digite sua resposta!\n'))
>> matequiz.py echo.        match sinal:
>> matequiz.py echo.            case '+':
>> matequiz.py echo.                rightAnswer = numero1 + numero2
>> matequiz.py echo.            case '-':
>> matequiz.py echo.                rightAnswer = numero1 - numero2
>> matequiz.py echo.            case 'x':
>> matequiz.py echo.                rightAnswer = numero1 * numero2
>> matequiz.py echo.            case '/':
>> matequiz.py echo.                rightAnswer = numero1 / numero2
>> matequiz.py echo.        if userAnswer == rightAnswer:
>> matequiz.py echo.            print('Correta Resposta!')
>> matequiz.py echo.        else:
>> matequiz.py echo.            print('Errado!')
>> matequiz.py echo.        time.sleep(2)
>> matequiz.py echo.
>> matequiz.py echo menuOptions = ['Jogar','Instrucoes','Sair']
>> matequiz.py echo.
>> matequiz.py echo def menu():
>> matequiz.py echo.    os.system('cls')
>> matequiz.py echo.    print('----------Seja bem-vindo ao MateQuiz!----------\nDigite uma das seguintes opcoes:')
>> matequiz.py echo.    for i in range(len(menuOptions)):
>> matequiz.py echo.        print(f"{i+1} - {menuOptions[i]}")
>> matequiz.py echo.    option = int(input(''))
>> matequiz.py echo.    match option:
>> matequiz.py echo.        case 1:
>> matequiz.py echo.            conta()
>> matequiz.py echo.        case 2:
>> matequiz.py echo.            os.system('cls')
>> matequiz.py echo.            print('Como jogar?\n As regras sao basicas, escolha uma quantidade de questoes para resolver, apos isso leia a questao e responda o resultado da conta. (Lembrando de usar "." em numeros decimais)')
>> matequiz.py echo.            input('Pressione ENTER para continuar...')
>> matequiz.py echo.            menu()
>> matequiz.py echo.        case 3:
>> matequiz.py echo.            exit()
>> matequiz.py echo.
>> matequiz.py echo menu()

:: Executa o jogo
echo Executando o jogo...
start matequiz.py

:: Remove o instalador de Python
del python-installer.exe
exit
