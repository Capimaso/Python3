#MateQuiz
import random
import time
import os

def conta():
    os.system('cls')
    erros = 0; #variavel que conta os erros
    questionValue = int(input('Quantas questoes gostaria de resolver? (Máximo 30)\n'))
    os.system('cls')
    questionDifficult = 0
    while (questionDifficult>3 or questionDifficult<1): #Apenas permite que o usuário escolha alguma dificuldade avaliavel
        questionDifficult = int(input('Qual dificuldade gostariade jogar?\n1-Fácil\n2-Médio\n3-Difícil\n'))
    for i in range(questionValue): #Vai ficar rodando o código que 
        os.system('cls')
        
        sinais = [['+',1,1],['-',1,1],['x',1,1],['÷',1,1],['√',0,0],['²',0,1]] #[simbolo em string, se a conta usa os dois numeros(1 pra sim e 0 pra nao), se o sinal vai na frente do numero1]
        sinal = random.randint(0,len(sinais)-1)#só cria um numero aleatorio baseado na quantidade de sinais que existem na array que guarda os sinais
        numero1 = random.randint(1,round(10**(questionDifficult-(1.5 if sinal>3 else 0)))**(2 if sinal==4 else 1)) #Define o primeiro numero baseado na dificuldade, elevando o }
        numero2 = random.randint(1,10**(questionDifficult-(2 if sinal>1 else 0)))         #limite dele(10) na pontencia, sendo que tem um filtro feito de if pra verificar se o }
        #/\/\/\                                                                           #sinal da conta é dificil, pra gerar um numero de 1 nivel de dificuldade menor        }
        # Faz igual, mas ele só é utilizado em conta mais simples,                        #(obs:contas dificeis usem apenas ele, por isso so ele fica grande)                   }
        # por isso sempre vai ser um numero alto, sem filtro de sinal                     #(obs2:ele faz a potencia do numero se for raiz quadrada, pra aparecer certo no print)}
        
        #VVV Verifica qual sinal que caiu e faz a conta da resposta correta que se espera do usuário
        match sinais[sinal][0]:
            case '+':
                rightAnswer = numero1+numero2
            case '-':
                rightAnswer = numero1-numero2
            case 'x':
                rightAnswer = numero1*numero2
            case '÷':
                while(numero1%numero2!=0):
                    numero1 = random.randint(1,10**questionDifficult)
                    numero2 = random.randint(1,10)
                rightAnswer = numero1/numero2
            case '√':
                rightAnswer = numero1**0.5
            case '²':
                rightAnswer = numero1**2
        
        #Posiciona osnumeros baseados nas preferencias de sinais usados na array sinais lá em cima
        if sinais[sinal][2] or sinais[sinal][1]:
            if sinais[sinal][1]:
                nmb2Print = numero2
            else:
                nmb2Print = ''
            nmb1Print = numero1
        else:
            nmb2Print = numero1
            nmb1Print = ''
        print('{}{}{} = ?'.format(nmb1Print, sinais[sinal][0], nmb2Print))
        
        userAnswer = float(input('Digite sua resposta!\n'))
        if userAnswer == rightAnswer:
            print('Correta Resposta!')
        else:
            print('Errado!')
            erros+=1;
        time.sleep(2)
        os.system('cls')
        if (erros ==3 or questionValue==erros):
            print('Fim de jogo!')
            time.sleep(3)
            menu()
    print('Parabéns, voce acertou todas as contas!')
    time.sleep(3)
    menu()
menuOptions = ['Jogar','Instruçoes','Sair']

#Funcao do menu, pra toda vez que terminar voltar ao menu.
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
            print('Como jogar?\n As regras sao básicas, escolha uma quantidade de questoes para resolver, após isso leia a questao e responda o resultado da conta, e se errar 3 vezes, o jogo acaba!')
            skipTutorial = input('Pressione ENTER para continuar...')
            menu()
        case 3:
            os.close()
menu()