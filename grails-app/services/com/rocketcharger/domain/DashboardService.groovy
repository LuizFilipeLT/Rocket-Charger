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

    public Map returnDashboardValues(Long customerId) {
        List<Payer> payerList = payerService.returnPayersByCustomer(customerId, getSizeLimitPage(), params.offset)
        Integer totalPayers = payerList.size()

        List<Payment> overduePaymentList = returnListPaymentsByCustomerAndStatus(customerId, PaymentStatus.OVERDUE)
        List<Payer> debtDodgersList = overduePaymentList.unique {Payment payment -> payment.payer}

        Integer debtDodgers = debtDodgersList.size()
        Integer nonDebtDodgers = totalPayers - debtDodgers

        BigDecimal receivedValue = returnListPaymentsByCustomerAndStatus(customerId, PaymentStatus.PAID).value.sum()
        BigDecimal toReceive = returnListPaymentsByCustomerAndStatus(customerId, PaymentStatus.PENDING).value.sum()
        BigDecimal overdue = overduePaymentList.value.sum()

        return [totalPayers: totalPayers, debtDodgers: debtDodgers, nonDebtDodgers: nonDebtDodgers, receivedValue: receivedValue, toReceive: toReceive, overdue: overdue]
    }

    private List<Payment> returnListPaymentsByCustomerAndStatus(Long customerId, PaymentStatus paymentStatus) {
        List<Payment> paymentList = Payment.createCriteria().list() {
            eq("customer", Customer.get(customerId)) and { 
                eq("status", paymentStatus)
            }
        }
        return paymentList
    }
}
