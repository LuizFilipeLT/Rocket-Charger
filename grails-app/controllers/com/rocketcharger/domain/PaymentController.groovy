package com.rocketcharger.domain

import com.rocketcharger.domain.payment.Payment
import com.rocketcharger.domain.payer.Payer
import com.rocketcharger.domain.customer.Customer
import com.rocketcharger.base.BaseController
import com.rocketcharger.enums.PaymentMethod
import com.rocketcharger.enums.PaymentStatus
import static org.springframework.http.HttpStatus.*
import grails.validation.ValidationException
import grails.converters.JSON

class PaymentController extends BaseController {
    
    def paymentService
    def payerService

   def list() {  
        Long customerId = params.long("id")
        List<Payment> paymentList = paymentService.returnPaymentsByCustomer(customerId, returnSizeLimitPage(), getCurrentPage())
        return [customerId: customerId, paymentList: paymentList, totalCount: paymentList.size()]
    }

    def create() {
        Long customerId = params.long("id")
        List<Payer> payerList = payerService.returnPayersByCustomer(customerId)
        return [customerId: customerId, payerList: payerList]
    }

    def save() {
        try {
            Payment payment = paymentService.validate(params)

            if (payment.hasErrors()) {
                render([success: false, message: message(code: payment.errors.allErrors.defaultMessage)] as JSON)
                return
            }
            payment = paymentService.save(params)

            render([success: true] as JSON)
        } catch(Exception e) {
            render([success: false, message: message(code: "occurrence.error")] as JSON)
        } 
    }

    def confirm() {
        Long paymentId = params.long("id")
        try {
            paymentService.recognizePayment(paymentId)
            redirect controller: "payment", action: "list", id: paymentId
            }
         catch (Exception e) {
            render([success: false, message: message(code: "occurrence.error")] as JSON)
        }
    }

    def show() {
        return [payment: Payment.get(params.long("id"))]
    }
 }