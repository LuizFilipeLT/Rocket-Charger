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
        name ()
        email (email: true, nullable: false)
        postalCode (size: 8..9)
        
    }

}
