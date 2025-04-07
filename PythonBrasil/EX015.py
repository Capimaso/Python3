# Faça um Programa que pergunte quanto você ganha por hora e o número de horas trabalhadas no mês. Calcule e mostre o total do seu salário no referido mês, sabendo-se que são 
# descontados 11% para o Imposto de Renda, 8% para o INSS e 5% para o sindicato, faça um programa que nos dê:
# salário bruto.
# quanto pagou ao INSS.
# quanto pagou ao sindicato.
# o salário líquido.
# calcule os descontos e o salário líquido, conforme a tabela abaixo:
# + Salário Bruto : R$
# - IR (11%) : R$
# - INSS (8%) : R$
# - Sindicato ( 5%) : R$
# = Salário Liquido : R$
# Obs.: Salário Bruto - Descontos = Salário Líquido.
ganhoporhora = float(input('Quanto você ganha por hora?: '))
horastrabalhadas = float(input('Quantas horas você trabalhou este mês?: '))
ganho = ganhoporhora*horastrabalhadas
ir = ganho*0.11
inss = ganho*0.08
sindicato = ganho*0.05
liquido = ganho-ir-inss-sindicato

print('Você vai ganhar R$',ganho,' este mês.')
print('Você pagou R$',ir,' para o Imposto de Renda.')
print('Você pagou R$',inss,' para o INSS.')
print('Você pagou R$',sindicato,' para o Sindicato.')
print('Seu salário liquido é de R$',liquido,' este mês.')