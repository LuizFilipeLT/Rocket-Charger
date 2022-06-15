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
        Customer customer = Customer.get(params.customerId)
        Long customerId = params.long("customerId")
        List<Payment> paymentList = paymentService.returnPaymentsByCustomer(customerId, getSizeLimitPage(), getCurrentPage())
        return [customerId: customerId, paymentList: paymentList, customer: customer, totalCount: paymentList.size()]
    }

    def create() {
        Long customerId = params.long("customerId")
        Customer customer = Customer.get(customerId)
        List<Payer> payerList = payerService.returnPayersByCustomer(customerId, getSizeLimitPage(), params.offset)
        return [customerId: customerId, payerList: payerList, customer: customer]
    }

    def save() {
        try {
            Customer customer = Customer.get(params.customerId)
            Payer payer = Payer.get(params.payerId)
            Payment payment = paymentService.save(customer, payer, params)

            if (payment.hasErrors()) {
                render([success: false, message: message(code: payment.errors.allErrors.defaultMessage)] as JSON)
                return
            }

            render([success: true] as JSON)
        } catch(Exception e) {
            e.printStackTrace()
            render([success: false, message: message(code: "occurrence.error")] as JSON)
        } 
    }

    def confirm() {
        Long paymentId = params.long("paymentId")
        try {
            Payment payment = paymentService.recognizePayment(paymentId)

                if (payment) {
                    redirect(controller: "payment", action: "list", params: [customerId: payment.customerId])
                    return
                }

        } catch(Exception e) {
            render([success: false, message: message(code: "occurrence.error")] as JSON)
        }
    }

    def show() {
        println params
        Customer customer = Customer.get(params.customerId)
        Long customerId = params.long("customerId")
        return [payment: Payment.get(params.long("paymentId")), customerId: customerId, customer: customer] 
    }
 }