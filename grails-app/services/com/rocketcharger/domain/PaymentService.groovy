package com.rocketcharger.domain

import com.rocketcharger.domain.payment.Payment
import com.rocketcharger.domain.payer.Payer
import com.rocketcharger.domain.customer.Customer
import com.rocketcharger.enums.PaymentMethod
import com.rocketcharger.enums.PaymentStatus
import com.rocketcharger.utils.FormatDateUtils
import com.rocketcharger.utils.DomainUtils
import grails.plugin.asyncmail.AsynchronousMailService
import grails.gorm.transactions.Transactional 
import grails.gsp.PageRenderer

@Transactional
class PaymentService {
    PageRenderer groovyPageRenderer
    def asynchronousMailService
    
    public Payment save(Map params) {
        Payment payment = new Payment()
        payment.value = new BigDecimal(params.value)
        payment.dueDate = FormatDateUtils.toDate(params.dueDate, "yyyy-MM-dd")
        payment.billingType = PaymentMethod.valueOf(params.billingType)
        payment.payer = Payer.get(params.long("payerId"))
        payment.customer = Customer.get(params.long("customerId"))
        payment.status = PaymentStatus.PENDING
        payment.save(failOnError: true)
        asynchronousMailService.sendMail {
            to payment.payer.email
            subject "Nova cobrança"
            html groovyPageRenderer.render(template:"/email/emailSendPayerPayment", model: [payment: payment])
        }
        asynchronousMailService.sendMail {
            to payment.customer.email
            subject "Nova cobrança"
            html groovyPageRenderer.render(template:"/email/emailSendCustomerPayment", model: [payment: payment])
        }
        return payment
    }

    public Payment recognizePayment(paymentId) {
        Payment payment = Payment.get(paymentId)
        payment.status = PaymentStatus.PAID
        payment.paymentDate = new Date()
        payment.save(failOnError: true)
        asynchronousMailService.sendMail {
            to payment.payer.email
            subject "Confirmação cobrança"
            html groovyPageRenderer.render(template:"/email/emailConfirmPayerPayment", model: [payment: payment])
        }
        asynchronousMailService.sendMail {
            to payment.customer.email
            subject "Confirmação cobrança"
            html groovyPageRenderer.render(template:"/email/emailConfirmCustomerPayment", model: [payment: payment])
        }
        return payment
    }

    public List<Payment> list() {
        return Payment.getAll()
    }

    public Payment getPayment(Long id) {
        return Payment.get(id)
    }

    public List<Payment> returnPaymentsByCustomer(Long customerId, Integer max, Integer offset) {
        List<Payment> paymentList = Payment.createCriteria().list(max: max, offset: offset){
            eq("customer", Customer.get(customerId))
        }
        return paymentList
    }

    public List<Payment> returnPaymentStatusDate(PaymentStatus paymentStatus, Date yesterdayDate) {
        List<Payment> paymentList = Payment.createCriteria().list() {
            eq("status", paymentStatus) and {
                ge("dueDate", yesterdayDate)
            }
        }
        return paymentList
    }
        
    public Payment validate(Map params) {
        Payment payment = new Payment()
        payment.value = new BigDecimal(params.value)
        payment.dueDate = FormatDateUtils.toDate(params.dueDate, "yyyy-MM-dd")
        payment.billingType = PaymentMethod.valueOf(params.billingType)
        payment.payer = Payer.get(params.long("payerId"))
        payment.customer = Customer.get(params.long("customerId"))
        payment.status = PaymentStatus.PENDING
        if (!payment.value) {
            DomainUtils.addError(payment, "Erro no registro do valor da cobrança informado.")
        }
        if (!payment.dueDate) {
            DomainUtils.addError(payment, "Erro no registro da data de vencimento informada.")
        }
        if (!payment.billingType) {
            DomainUtils.addError(payment, "Erro no registro do método de pagamento informado.")
        }
        if (!payment.payer) {
            DomainUtils.addError(payment, "Erro no registro do pagador informado.")
        }
        if (!payment.customer) {
            DomainUtils.addError(payment, "Erro, contate o administrador.")
        }
        if (!payment.status) {
            DomainUtils.addError(payment, "Erro no registro do status da cobrança informado.")
        }
        return payment
    }

    public Payment validateRecognizePayment(Map params) {
        Payment payment = new Payment()
        if (!params.value) {
            DomainUtils.addError(payment, "Erro no registro do valor informado.")
        }
        if (!params.dueDate) {
            DomainUtils.addError(payment, "Erro no registro da data de vencimento informada.")
        }
        if (!params.billingType) {
            DomainUtils.addError(payment, "Erro no registro do método de pagamento informado.")
        }
        if (!params.payer) {
            DomainUtils.addError(payment, "Erro no registro do pagador informado.")
        }
        if (!params.customer) {
            DomainUtils.addError(payment, "Erro, contate o administrador.")
        }
        if (!params.status) {
            DomainUtils.addError(payment, "Erro no registro do status da cobrança informado.")
        }
        return payment
    }
}
