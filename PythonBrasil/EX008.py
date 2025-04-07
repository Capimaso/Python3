# Faça um Programa que pergunte quanto você ganha por hora e o número de horas trabalhadas no mês. Calcule e mostre o total do seu salário no referido mês.
ganhoporhora = float(input('Quanto você ganha por hora?: '))
horastrabalhadas = float(input('Quantas horas você trabalhou este mês?: '))
ganho = ganhoporhora*horastrabalhadas
print('Você vai ganhar ',ganho,' este mês.')