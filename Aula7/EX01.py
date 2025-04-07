#Elabore um algoritmo que dada a idade de um nadador classifica-o em uma das
#seguintes categorias:
# infantil A = 5 - 7 anos
# infantil B = 8-10 anos
# juvenil A = 11-13 anos
# juvenil B = 14-17 anos
# adulto = maiores de 18 anos

#entrada
idade = int(input('Informe sua idade: '))  

if idade>=18:
    classe = 'adulto'
elif idade>=14:
    classe = 'juvenil B'
elif idade>=11:
    classe = 'juvenil A'
elif idade>=8:
    classe = 'infantil B'
else:
    classe = 'infantil A'

#saída
print('Você é {}'.format(classe))