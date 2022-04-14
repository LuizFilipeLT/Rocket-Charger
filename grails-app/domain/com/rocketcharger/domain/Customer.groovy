package com.rocketcharger.domain

class Customer {

    String name
    String email
    String postalCode
    String address
    String city
    String state

    static constraints = {
        nome size: 5..150
        email size: 5..120
    }
}
