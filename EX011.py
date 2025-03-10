# Faça um Programa que peça 2 números inteiros e um número real. Calcule e mostre:
# a) o produto do dobro do primeiro com metade do segundo.
# b) a soma do triplo do primeiro com o terceiro.
# c) o terceiro elevado ao cubo.
inteiro1 = int(input('Informe o primeiro número inteiro: '))
inteiro2 = int(input('Informe o segundo número inteiro: '))
quebrado = float(input('Informe o número quebrado: '))
a = inteiro1*2+inteiro2/2
b = inteiro1*3+quebrado
c = quebrado*quebrado*quebrado
print('O produto do dobro do primeiro com a metade do segundo: ',a)
print('A soma do triplo do primeiro com o terceiro: ',b)
print('O terceiro elevado ao cubo: ',c)