	@echo off
title Instalador do MateQuiz


::Deleta Python da MicrosoftStore
powershell -Command "Get-AppxPackage *Python* | Remove-AppxPackage"

:: Cria pasta para o jogo
set "folderName=MateQuizFolder"
mkdir "%~dp0%folderName%"
cd "%~dp0%folderName%"

echo Instalando Python...
curl -o python-installer.exe https://www.python.org/ftp/python/3.12.2/python-3.12.2-amd64.exe

python-installer.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

where python >nul 2>nul
if errorlevel 1 (
    echo Erro: Python nao foi instalado corretamente.
    exit /b
)

echo Instalando Nuitka...
python -m pip install --upgrade pip
python -m pip install nuitka

echo Criando o arquivo matequiz.py...

> matequiz.py echo #MateQuiz
>> matequiz.py echo import random
>> matequiz.py echo import time
>> matequiz.py echo import os
>> matequiz.py echo def conta():
>> matequiz.py echo.    os.system('cls')
>> matequiz.py echo.    erros = 0; #variavel que conta os erros
>> matequiz.py echo.    questionValue = int(input('Quantas questoes gostaria de resolver? (Máximo 30)\n'))
>> matequiz.py echo.    os.system('cls')
>> matequiz.py echo.    questionDifficult = 0
>> matequiz.py echo.    while (questionDifficult^>3 or questionDifficult^<1): #Apenas permite que o usuário escolha alguma dificuldade avaliavel
>> matequiz.py echo.        questionDifficult = int(input('Qual dificuldade gostariade jogar?\n1-Facil\n2-Medio\n3-Dificil\n'))
>> matequiz.py echo.    for i in range(questionValue): #Vai ficar rodando o codigo que 
>> matequiz.py echo.        os.system('cls')
>> matequiz.py echo.        sinais = [['+',1,1],['-',1,1],['x',1,1],['÷',1,1],['√',0,0],['²',0,1]] #[simbolo em string, se a conta usa os dois numeros(1 pra sim e 0 pra nao), se o sinal vai na frente do numero1]
>> matequiz.py echo.        sinal = random.randint(0,len(sinais)-1)#só cria um numero aleatorio baseado na quantidade de sinais que existem na array que guarda os sinais
>> matequiz.py echo.        numero1 = random.randint(1,round(10**(questionDifficult-(1.5 if sinal^>3 else 0)))**(2 if sinal==4 else 1)) #Define o primeiro numero baseado na dificuldade, elevando o }
>> matequiz.py echo.        numero2 = random.randint(1,10**(questionDifficult-(2 if sinal^>1 else 0)))         #limite dele(10) na pontencia, sendo que tem um filtro feito de if pra verificar se o }
>> matequiz.py echo.        #/\/\/\                                                                           #sinal da conta é dificil, pra gerar um numero de 1 nivel de dificuldade menor        }
>> matequiz.py echo.        # Faz igual, mas ele só é utilizado em conta mais simples,                        #(obs:contas dificeis usem apenas ele, por isso so ele fica grande)                   }
>> matequiz.py echo.        # por isso sempre vai ser um numero alto, sem filtro de sinal                     #(obs2:ele faz a potencia do numero se for raiz quadrada, pra aparecer certo no print)}
>> matequiz.py echo.        #VVV Verifica qual sinal que caiu e faz a conta da resposta correta que se espera do usuário
>> matequiz.py echo.        match sinais[sinal][0]:
>> matequiz.py echo.            case '+':
>> matequiz.py echo.                rightAnswer = numero1+numero2
>> matequiz.py echo.            case '-':
>> matequiz.py echo.                rightAnswer = numero1-numero2
>> matequiz.py echo.            case 'x':
>> matequiz.py echo.                rightAnswer = numero1*numero2
>> matequiz.py echo.            case '÷':
>> matequiz.py echo.                while(numero1%%numero2!=0):
>> matequiz.py echo.                    numero1 = random.randint(1,10**questionDifficult)
>> matequiz.py echo.                    numero2 = random.randint(1,10)
>> matequiz.py echo.                rightAnswer = numero1/numero2
>> matequiz.py echo.            case '√':
>> matequiz.py echo.                rightAnswer = numero1**0.5
>> matequiz.py echo.            case '²':
>> matequiz.py echo.                rightAnswer = numero1**2
>> matequiz.py echo.        #Posiciona osnumeros baseados nas preferencias de sinais usados na array sinais lá em cima
>> matequiz.py echo.        if sinais[sinal][2] or sinais[sinal][1]:
>> matequiz.py echo.            if sinais[sinal][1]:
>> matequiz.py echo.                nmb2Print = numero2
>> matequiz.py echo.            else:
>> matequiz.py echo.                nmb2Print = ''
>> matequiz.py echo.            nmb1Print = numero1
>> matequiz.py echo.        else:
>> matequiz.py echo.            nmb2Print = numero1
>> matequiz.py echo.            nmb1Print = ''
>> matequiz.py echo.        print('{}{}{} = ?'.format(nmb1Print, sinais[sinal][0], nmb2Print))
>> matequiz.py echo.        userAnswer = float(input('Digite sua resposta!\n'))
>> matequiz.py echo.        if userAnswer == rightAnswer:
>> matequiz.py echo.            print('Correta Resposta!')
>> matequiz.py echo.        else:
>> matequiz.py echo.            print('Errado!')
>> matequiz.py echo.            erros+=1;
>> matequiz.py echo.        time.sleep(2)
>> matequiz.py echo.        os.system('cls')
>> matequiz.py echo.        if (erros ==3 or questionValue==erros):
>> matequiz.py echo.            print('Fim de jogo!')
>> matequiz.py echo.            time.sleep(3)
>> matequiz.py echo.            menu()
>> matequiz.py echo.    print('Parabéns, voce acertou todas as contas!')
>> matequiz.py echo.    time.sleep(3)
>> matequiz.py echo.    menu()
>> matequiz.py echo menuOptions = ['Jogar','Instruçoes','Sair']
>> matequiz.py echo #Funcao do menu, pra toda vez que terminar voltar ao menu.
>> matequiz.py echo def menu():
>> matequiz.py echo.    os.system('cls')
>> matequiz.py echo.    print('----------Seja bem-vindo ao MateQuiz!----------\nDigite uma das seguintes opçoes:')
>> matequiz.py echo.    for i in range(len(menuOptions)):
>> matequiz.py echo.        print('{} - {}'.format((i+1), menuOptions[i]))
>> matequiz.py echo.    option = int(input(''))
>> matequiz.py echo.    match option:
>> matequiz.py echo.        case 1:
>> matequiz.py echo.            conta()
>> matequiz.py echo.        case 2:
>> matequiz.py echo.            os.system('cls')
>> matequiz.py echo.            print('Como jogar?\n As regras sao basicas, escolha uma quantidade de questoes para resolver, apos isso leia a questao e responda o resultado da conta, e se errar 3 vezes, o jogo acaba!')
>> matequiz.py echo.            skipTutorial = input('Pressione ENTER para continuar...')
>> matequiz.py echo.            menu()
>> matequiz.py echo.        case 3:
>> matequiz.py echo.            os.close()
>> matequiz.py echo menu()

echo Compilando com Nuitka...
python -m nuitka --onefile --windows-console-mode=force --assume-yes-for-downloads matequiz.py

echo Limpando arquivos temporários...
del matequiz.py
del python-installer.exe

mshta "javascript:alert('Instalacao concluida com sucesso!');close()"
exit
