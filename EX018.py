# Faça um programa que peça o tamanho de um arquivo para download (em MB) e a velocidade de um link de Internet (em Mbps), calcule e informe o tempo aproximado de download 
# do arquivo usando este link (em minutos).
arquivo = float(input('Qual tamanho do arquivo que deseja baixar(Em Mb)?: '))
internet = float(input('Qual sua velocidade de Download em Mbps?: '))
segundos = arquivo/internet
minutos = 0
horas = 0
while (segundos>=60):
    segundos-=60
    minutos+=1
while (minutos>=60):
    minutos-=60
    horas+=1
print('Seu Download vai demorar',round(horas),'horas,',round(minutos),'minutos e',round(segundos),'segundos.')