package com.rocketcharger.domain

import com.rocketcharger.domain.customer.Customer
import com.rocketcharger.domain.payment.Payment
import com.rocketcharger.domain.PaymentService
import com.rocketcharger.domain.payer.Payer
import com.rocketcharger.utils.DomainUtils
import com.rocketcharger.utils.ValidateUtils
import com.rocketcharger.enums.PaymentStatus
import grails.gorm.transactions.Transactional

@Transactional
class DashboardService {

    def paymentService
    
    public Map returnDashboardValues(Customer customer) {
        List<Payer> payerList = getPayersByCustomer(customer)
        Integer totalPayers = payerList.size()

        List<Payment> overduePaymentList = returnListPaymentsByCustomerAndStatus(customer, PaymentStatus.OVERDUE)
        List<Payer> defaultersList = overduePaymentList.unique {Payment payment -> payment.payer}

        Integer defaulters = defaultersList.size()
        Integer nonDefaulters = totalPayers - defaulters

        BigDecimal receivedValue = returnListPaymentsByCustomerAndStatus(customer, PaymentStatus.PAID).value.sum()
        BigDecimal toReceive = returnListPaymentsByCustomerAndStatus(customer, PaymentStatus.PENDING).value.sum()
        BigDecimal overdue = overduePaymentList.value.sum()

        return [
            totalPayers: totalPayers,
            defaulters: defaulters,
            nonDefaulters: nonDefaulters,
            receivedValue: receivedValue ?: 0,
            toReceive: toReceive ?: 0,
            overdue: overdue ?: 0
        ]
    }

    private List<Payment> returnListPaymentsByCustomerAndStatus(Customer customer, PaymentStatus paymentStatus) {
        List<Payment> paymentList = Payment.createCriteria().list() {
            eq("customer", customer) and { 
                eq("status", paymentStatus)
            }
        }
        return paymentList
    }

    private List<Payer> getPayersByCustomer(Customer customer) {
        def payerCriteria = Payer.createCriteria()
        List<Payer> payerList = payerCriteria.list() {
            eq("customer", customer)
        }
        return payerList
    }

}
