package com.rocketcharger.domain.payer

import com.rocketcharger.domain.customer.Customer

class Payer {

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
    
    Customer customer

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
