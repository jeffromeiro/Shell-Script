#!/bin/bash

resposta_http=$(curl -o /dev/null -w %{http_code} -s http://localhost)

if [ $resposta_http -ne 200 ]
then
mail -s "Problema no servidor" jeffromeiro@gmail.com<<del
Houve um problema ano servidor e os usuários pararam de ter acesso ao conteúdo web
del
    /opt/lampp/lampp startapache 

fi
