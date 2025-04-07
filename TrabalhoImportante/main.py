#MateQuiz
import random
import time
import os

def conta():
    os.system('cls')
    questionValue = int(input('Quantas questoes gostaria de resolver? (Máximo 30)\n'))
    for i in range(questionValue):
        os.system('cls')
        numero1 = random.randint(1,9)
        numero2 = random.randint(1,9)
        sinal = random.choice(['+','-','x','÷'])
        print('{} {} {} = ?'.format(numero1, sinal, numero2))
        userAnswer = float(input('Digite sua resposta!\n'))
        match sinal:
            case '+':
                rightAnswer = numero1+numero2
            case '-':
                rightAnswer = numero1-numero2
            case 'x':
                rightAnswer = numero1*numero2
            case '÷':
                rightAnswer = numero1/numero2
        if userAnswer == rightAnswer:
            print('Correta Resposta!')
        else:
            print('Errado!')
        time.sleep(2)

menuOptions = ['Jogar','Instruçoes','Sair']

def menu():
    os.system('cls')
    print('----------Seja bem-vindo ao MateQuiz!----------\nDigite uma das seguintes opções:')
    for i in range(len(menuOptions)):
        print('{} - {}'.format((i+1), menuOptions[i]))
    option = int(input(''))
    match option:
        case 1:
            conta()
        case 2:
            os.system('cls')
            print('Como jogar?\n As regras sao básicas, escolha uma quantidade de questoes para resolver, após isso leia a questao e responda o resultado da conta.(Lembrando de usar "." em números decimais)')
            skipTutorial = input('Pressione ENTER para continuar...')
            menu()
        case 3:
            os.close()
menu()