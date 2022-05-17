package com.rocketcharger.domain.payer

import com.rocketcharger.domain.customer.Customer
import com.rocketcharger.base.BaseEntity


class Payer extends BaseEntity {

    String name

    String email

    String cpfCnpj

    String postalCode

    String address

    String district

    String city

    String state
    
    Customer customer

    static constraints = { }

}
