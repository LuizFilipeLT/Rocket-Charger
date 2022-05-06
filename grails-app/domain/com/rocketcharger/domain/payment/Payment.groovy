package com.rocketcharger.domain.payment

import com.rocketcharger.domain.customer.Customer
import com.rocketcharger.domain.payer.Payer

class Payer {

    String value
    String billingType
    String dueDate
    Customer customer
    Payer payer

    static constraints = {}

}
