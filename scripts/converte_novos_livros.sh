#!/bin/bash

CAMINHO_DIRETORIO=/home/jefferson/Treinamento/Alura/shell-script/imagens-novos-livros

converte_imagem(){

   imagem=$(ls $1 |awk -F. '{print $1}')
   convert $imagem.jpg $imagem.png

}

verifica_diretorio(){
   
   cd $1
   for imagem in *
   do
       local caminho_imagem=$(find $1 -name $imagem)
       if [ -d $caminho_imagem ]
       then
	   verifica_diretorio $caminho_imagem
       else
	   converte_imagem $caminho_imagem
       fi
   done
}

verifica_diretorio $CAMINHO_DIRETORIO #2> $CAMINHO_DIRETORIO/log.txt
if [ $? -eq 0 ]
then
    echo "Procedimento efetuado com sucesso" 
else
    echo "Erro no procedimento"
fi
