package com.rocketcharger.domain.payment

import com.rocketcharger.domain.customer.Customer
import com.rocketcharger.domain.payer.Payer
import com.rocketcharger.enums.PaymentMethod
import com.rocketcharger.enums.PaymentStatus

class Payment {

    BigDecimal value

    PaymentMethod billingType
    
    PaymentStatus status

    Date dueDate

    Customer customer
    
    Payer payer

    static constraints = {

    }
}
