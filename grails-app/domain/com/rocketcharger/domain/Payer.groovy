package com.rocketcharger.domain.payer

class Payer {

    String name

    String email

    String cpfCnpj

    String postalCode

    String address

    String district

    String city
    
    String state
    
     static constraints = {
        name size: 3..100, nulllable: false, blank: false
        email email:true, unique:true
        cpfCnpj nulllable: false, unique: true, blank: false
        postalCode size: 8..9, nulllable: false, blank: false 
        address size: 2..100, nulllable: false, blank: false
        district size: 2..100, nulllable: false, blank: false
        city size: 2..50, nulllable: false, blank: false
        state size: 1..50, nulllable: false, blank: false

        // cpfCnpj validator: { valor, payer -> 
        //     if(!valor.size() == 11 || 14) 
        //     alert('erro ao validar CPF/CNPJ')
        //     return
        }
    }
