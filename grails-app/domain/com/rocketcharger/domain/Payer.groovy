package com.rocketcharger.domain.payer

class Payer {

    String name
    String email
    String cpfCnpj
    String postalCode
    String address
    String province
    String city
    String state
    
     static constraints = {
        name size: 3..100, nulllable: true
        email size: 5..100, nulllable: true

    }
}