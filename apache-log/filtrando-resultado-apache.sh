#!/bin/bash

cd ~/Treinamento/Alura/shell-script/apache-log

ip=$1
regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

if [[ $ip =~ $regex ]]
then
   cat apache.log |grep $ip
   if [ $? -ne 0 ] 
   then
      echo "Não foi encontrado IP no arquivo"
   fi   
else
   echo "Formato de IP incompatível"
fi
