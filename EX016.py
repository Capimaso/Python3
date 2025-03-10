# Faça um programa para uma loja de tintas. O programa deverá pedir o tamanho em metros quadrados da área a ser pintada. Considere que a cobertura da tinta é de 1 litro 
# para cada 3 metros quadrados e que a tinta é vendida em latas de 18 litros, que custam R$ 80,00. Informe ao usuário a quantidades de latas de tinta a serem compradas e o preço total.
area = int(input('Qual a área em metros quadrados que deseja pintar?(Em metros quadrados): '))
latas = 0
while (area>0):
    area-=54
    latas+=1
preco = latas*80
print('Você deverá comprar ',latas,' latas de tinta de 18 litros, que te custará R$',preco)