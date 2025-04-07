#MateQuiz
import random
import time

print('----------Seja bem-vindo ao MateQuiz!----------')

def conta(numero1,numero2,sinal):
    match sinal:
        case '+':
            print('{} + {} = ?'.format(numero1,numero2))
            rightAnswer = numero1+numero2
            userAnswer = float(input('Digite sua resposta!'))
            if userAnswer == rightAnswer:
                print('Correta Resposta!')
        case '-':
            print('{} - {} = ?'.format(numero1,numero2,(numero1-numero2)))
            rightAnswer = numero1-numero2
            userAnswer = float(input('Digite sua resposta!'))
            if userAnswer == rightAnswer:
                print('Correta Resposta!')
        case '*':
            print('{} x {} = ?'.format(numero1,numero2,(numero1*numero2)))
            rightAnswer = numero1*numero2
            userAnswer = float(input('Digite sua resposta!'))
            if userAnswer == rightAnswer:
                print('Correta Resposta!')
        case '/':
                print('{} ÷ {} = ?'.format(numero1,numero2,(numero1/numero2)))
                rightAnswer = numero1/numero2
                userAnswer = float(input('Digite sua resposta!'))
                if userAnswer == rightAnswer:
                    print('Correta Resposta!')


conta(random.randint(1,9),random.randint(1,9),random.choice(['+','-','*','/']))