package com.rocketcharger.domain

class Customer {

    String nome
    String id
    Integer idade
    Date nascimento
    String genero
    String email
    String cep
    String endereço
    String bairro
    String cidade
    String estado

    static constraints = {
        nome size: 5..150
        email size: 5..120
        idade min: 18
        genero inList:["M","F"]
    }
}
