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
        name blank: false 
        email email: true, blank: false, unique: true
        cpfCnpj blank: false
        postalCode blank: false
        address blank: false
        district blank: false
        city blank: false
        state blank: false
    }
}
