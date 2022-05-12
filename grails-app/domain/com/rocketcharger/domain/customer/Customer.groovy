package com.rocketcharger.domain.customer

class Customer {

    String name
    String email
    String cpfCnpj
    String postalCode
    String address
    String district
    String city
    String state

    static constraints = { 
        name size: 3..100, nulllable: false
        email size: 5..100, nulllable: false
        cpfCnpj size: 11..14, nulllable: false, unique: true
        postalCode size: 8..9, nulllable: false
        address size: 2..100, nulllable: false
        district size: 2..100, nulllable: false
        city size: 2..50, nulllable: false
        state size: 1..50, nulllable: false
    }

}
