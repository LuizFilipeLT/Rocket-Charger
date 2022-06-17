package com.rocketcharger.domain

import com.rocketcharger.domain.customer.Customer
import com.rocketcharger.domain.payment.Payment
import com.rocketcharger.domain.PaymentService
import com.rocketcharger.domain.PayerService
import com.rocketcharger.domain.payer.Payer
import com.rocketcharger.utils.DomainUtils
import com.rocketcharger.utils.ValidateUtils
import com.rocketcharger.enums.PaymentStatus
import grails.gorm.transactions.Transactional

@Transactional
class DashboardService {

    def payerService
    def paymentService
    
    public Map returnDashboardValues(Customer customerId) {
        List<Payer> payerList = payerService.returnPayersByCustomer(customerId)
        Integer totalPayers = payerList.size()

        List<Payment> overduePaymentList = returnListPaymentsByCustomerAndStatus(customerId, PaymentStatus.OVERDUE)
        List<Payer> debtDodgersList = overduePaymentList.unique {Payment payment -> payment.payer}

        Integer debtDodgers = debtDodgersList.size()
        Integer nonDebtDodgers = totalPayers - debtDodgers

        BigDecimal receivedValue = returnListPaymentsByCustomerAndStatus(customerId, PaymentStatus.PAID).value.sum()
        BigDecimal toReceive = returnListPaymentsByCustomerAndStatus(customerId, PaymentStatus.PENDING).value.sum()
        BigDecimal overdue = overduePaymentList.value.sum()

        return [
            totalPayers: totalPayers,
            debtDodgers: debtDodgers,
            nonDebtDodgers: nonDebtDodgers,
            receivedValue: receivedValue ?: 0,
            toReceive: toReceive ?: 0,
            overdue: overdue ?: 0
        ]
    }

    private List<Payment> returnListPaymentsByCustomerAndStatus(Customer customerId, PaymentStatus paymentStatus) {
        List<Payment> paymentList = Payment.createCriteria().list() {
            eq("customer", customerId) and { 
                eq("status", paymentStatus)
            }
        }
        return paymentList
    }

}
