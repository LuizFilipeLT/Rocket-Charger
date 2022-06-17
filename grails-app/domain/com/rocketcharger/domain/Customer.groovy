package com.rocketcharger.domain.customer

class Customer {

    String name

    String phone

    String email

    String cpfCnpj

    String postalCode

    String address

    String addressNumber

    String district

    String city
    
    String state
    
     static constraints = {
        name nullable: true 
        phone nullable: true
        email email: true, nullable: false
        cpfCnpj nullable: true 
        postalCode nullable: true 
        address nullable: true 
        addressNumber nullable: true
        district nullable: true 
        city nullable: true 
        state nullable: true 
    }
}
