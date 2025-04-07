#Tendo como dado de entrada a altura (h) de uma pessoa, construa um algoritmo que calcule seu peso ideal, utilizando as seguintes fórmulas:
# a) Para homens: (72.7*h) - 58
# b) Para mulheres: (62.1*h) - 44.7
altura = float(input('Informe sua altura em metros(Ex:1.72): '))
sexo = str(input('Informe seu sexo(h = homem; m =  mulher): '))
if (sexo.upper()=='H'):
    ideal = (72.7*altura) - 58
else: 
    ideal = (62.1*altura) - 44.7