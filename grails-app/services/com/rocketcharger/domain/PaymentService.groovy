package com.rocketcharger.domain

import com.rocketcharger.domain.customer.Customer
import com.rocketcharger.domain.payer.Payer
import com.rocketcharger.domain.payment.Payment
import com.rocketcharger.domain.PayerService
import com.rocketcharger.domain.EmailService
import com.rocketcharger.enums.PaymentMethod
import com.rocketcharger.enums.PaymentStatus
import com.rocketcharger.utils.FormatDateUtils
import com.rocketcharger.utils.DomainUtils
import com.rocketcharger.utils.ValidateUtils

import grails.gorm.transactions.Transactional
import grails.gsp.PageRenderer

@Transactional
class PaymentService {
    
    PageRenderer groovyPageRenderer
    def emailService
    def payerService
    
    public Payment save(Customer customer, Payer payer, Map params) {
        Payment payment = new Payment()
        payment = validate(payment, params)
        if (payment.hasErrors()) return payment
        payment.value = new BigDecimal(params.value)
        payment.dueDate = FormatDateUtils.toDate(params.dueDate, "yyyy-MM-dd")
        payment.billingType = PaymentMethod.valueOf(params.billingType)
        payment.customer = customer
        payment.payer = payer
        payment.status = PaymentStatus.PENDING
        payment.save(failOnError: true)
        notifyNewPayment(payment)
        return payment
    }

    public Payment recognizePayment(paymentId) {
        Payment payment = Payment.get(paymentId)
        payment.status = PaymentStatus.PAID
        payment.paymentDate = new Date()
        payment.save(flush: true, failOnError: true)
        notifyConfirmPayment(payment)
        return payment
    }

    public List<Payment> returnPaymentsByCustomer(Customer customerId, Integer max, Integer offset) {
        List<Payment> paymentList = Payment.createCriteria().list(max: max, offset: offset){
            eq("customer", customerId)
        }
        return paymentList
    }

    public List<Payment> list(PaymentStatus paymentStatus, Date yesterdayDate) {
        List<Payment> paymentList = Payment.createCriteria().list() {
            eq("status", paymentStatus) and {
                le("dueDate", yesterdayDate)
            }
        }
        return paymentList
    }
        
    public Payment validate(Payment payment, Map params) {
        if (!ValidateUtils.validateMinValue(params.value)) {
            DomainUtils.addError(payment, "O campo valor é obrigatório")
        }
        if (!ValidateUtils.isNotNull(params.payer)) {
            DomainUtils.addError(payment, "O campo pagador é obrigatório")
        }
        if (!ValidateUtils.validatePaymentMethod(params.billingType)) {
            DomainUtils.addError(payment, "O campo método de pagamento é obrigatório")
        }
        if (!ValidateUtils.validatePaymentDueDate(params.dueDate)){
             DomainUtils.addError(payment, "O campo data de vencimento é obrigatório")
        }
        return payment
    }

    public Payment validateRecognizePayment(Map params) {
        Payment payment = new Payment()
        if (payment.status == PaymentStatus.OVERDUE) {
            DomainUtils.addError(payment, "Uma cobrança vencida não pode ser paga.")
        }
        if (!params.value) {
            DomainUtils.addError(payment, "O campo valor é obrigatório")
        }
        if (!params.dueDate) {
            DomainUtils.addError(payment, "O campo data de vencimento é obrigatório")
        }
        if (!params.billingType) {
            DomainUtils.addError(payment, "O campo método de pagamento é obrigatório")
        }
        if (!params.payer) {
            DomainUtils.addError(payment, "O campo pagador é obrigatório")
        }
        return payment
    }

    public void notifyNewPayment(Payment payment) {
        String subject = "Nova cobrança"
        emailService.sendEmail(payment.customer.email, subject, groovyPageRenderer.render(template: "/email/emailSendCustomerPayment", model: [payment: payment]))
        emailService.sendEmail(payment.payer.email, subject, groovyPageRenderer.render(template: "/email/emailSendPayerPayment", model: [payment: payment]))
    }

    public void notifyConfirmPayment(Payment payment) {
        String subject = "Cobrança confirmada"
        emailService.sendEmail(payment.customer.email, subject, groovyPageRenderer.render(template: "/email/emailConfirmCustomerPayment", model: [payment: payment]))
        emailService.sendEmail(payment.payer.email, subject, groovyPageRenderer.render(template: "/email/emailConfirmPayerPayment", model: [payment: payment]))
    }
    
    public List<Payment> verifyOverDueDates(Long customerId, PaymentStatus paymentStatus) {
        Date yesterdayDate = FormatDateUtils.getYesterdayDate()
        List<Payment> paymentList = list(PaymentStatus.PENDING, yesterdayDate)
          for(Payment payment : paymentList) {
              payment.status = PaymentStatus.OVERDUE
              payment.save(failOnError:true)
        }
    }
}
