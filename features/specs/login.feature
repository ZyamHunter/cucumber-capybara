# encoding: utf-8
# language: pt

Funcionalidade: login

Contexto:
    Dado que esteja na página de login

Cenário: login válido
    Quando preencher as credenciais corretamente
    E confirmar o sms
    Então será logado no sistema

Cenário: login inválido
    Quando preencher as credenciais incorretamente
    Mas não será encaminhado para a página de sms
    E não será logado no sistema
