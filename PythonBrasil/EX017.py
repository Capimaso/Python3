# Faça um Programa para uma loja de tintas. O programa deverá pedir o tamanho em metros quadrados da área a ser pintada. Considere que a cobertura da tinta é de 1 litro para 
# cada 6 metros quadrados e que a tinta é vendida em latas de 18 litros, que custam R$ 80,00 ou em galões de 3,6 litros, que custam R$ 25,00.
# Informe ao usuário as quantidades de tinta a serem compradas e os respectivos preços em 3 situações:
# comprar apenas latas de 18 litros;
# comprar apenas galões de 3,6 litros;
# misturar latas e galões, de forma que o desperdício de tinta seja menor. Acrescente 10% de folga e sempre arredonde os valores para cima, isto é, considere latas cheias.

area = int(input('Qual a área em metros quadrados que deseja pintar?(Em metros quadrados): '))
situacao = int(input('Escolha uma das três opções para reproduzir.\n1 - Comprando apenas galões de 18 litros, que custam R$80.\n2 - Comprando apenas latas de 3,6 litros, que custam R$25.\n3 - Comprando intercalado, que vai poupar dinheiro!\n'))
latas = 0
galoes = 0
preco = 0
liquido = 0
def galao():
    global area,situacao,latas,galoes,preco,liquido
    while (area>0):
        area-=108
        latas+=1
    preco = latas*80
    liquido = preco*1.1
    print('Você deverá comprar ',latas,' galões de tinta de 18 litros, que te custará R$',round(liquido))
def lata():
    global area,situacao,latas,galoes,preco,liquido
    while (area>0):
        area-=21.6
        latas+=1
    preco = latas*25
    liquido = preco*1.1
    print('Você deverá comprar ',latas,' latas de tinta de 3,6 litros, que te custará R$',round(liquido))
def intercalado():
    global area,situacao,latas,galoes,preco,liquido
    while (area>0):
        if area>=108:
            area-=108
            galoes+=1
        else:
            area-=21.6
            latas+=1
    preco = latas*25+galoes*80
    liquido = preco*1.1
    print('Você deverá comprar',latas,'latas de tinta de 3,6 litros e',galoes,'galões de tinta de 18 litros, que te custará R$',round(liquido))
if situacao==1:galao()
elif situacao==2:lata()
else:intercalado()