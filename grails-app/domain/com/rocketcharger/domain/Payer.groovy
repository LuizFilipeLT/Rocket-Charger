package com.rocketcharger.domain.payer

class Payer {

    String name
    String email
    Date birthday
    String postalCode
    String address
    String city
    String state
    
    
     static constraints = {
        name size: 3..100, nulllable: true
        id size: 10..10, nulllable: true
        email size: 5..100, nulllable: true

    }
}