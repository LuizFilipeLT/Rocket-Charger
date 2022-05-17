package com.rocketcharger.domain.customer

import com.rocketcharger.base.BaseEntity

class Customer extends BaseEntity {

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

    }
}