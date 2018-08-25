#!/bin/bash

converte_imagem(){
CAMINHO_IMAGENS=~/Treinamento/Alura/shell-script/imagens-livros
CAMINHO_DESTINO=$CAMINHO_IMAGENS/png
if [ ! -d $CAMINHO_DESTINO ] 
then
    mkdir $CAMINHO_DESTINO
fi

cd $CAMINHO_IMAGENS
for imagem in *.jpg
do
    imagem_sem_extensao=$(ls $imagem |awk -F. '{print $1}')
    convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
done
}

converte_imagem 2> log_erro_$(date +%d%m%y).txt
if [ $? -eq 0 ]
then
    echo "Executado com sucesso"
else
    echo "Houve um erro na execução"
fi
