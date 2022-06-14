package com.rocketcharger.domain

import static org.springframework.http.HttpStatus.*
import com.rocketcharger.base.BaseController
import com.rocketcharger.domain.payer.Payer
import com.rocketcharger.domain.customer.Customer
import grails.converters.JSON

class PayerController extends BaseController {
    
    def payerService

    def list() {
        Long customerId = params.long("customerId")
        List<Payer> payerList = payerService.returnPayersByCustomer(customerId, getSizeLimitPage(), getCurrentPage())
        return[customerId: customerId, payerList: payerList, totalCount: Payer.count()]
    }

    def create() {
        return [customerId: params.long("customerId")]
    }

    def save() {
        try {
            Customer customer = Customer.get(params.customerId)
            Payer payer = payerService.save(customer, params)
            
            if (payer.hasErrors()) {
                render([success: false, message: message(code: payer.errors.allErrors[0].defaultMessage ?: payer.errors.allErrors[0].codes[0])] as JSON)
                return
            }
            
            render([success: true] as JSON)
        } catch (Exception e) {
            render([success: false, message: message(code: "occurrence.error")] as JSON)
        }
    }

    def update() {
        try {
            Payer payer = payerService.update(params)
            
            if (payer.hasErrors()) {
                render([success: false, message: message(code: payer.errors.allErrors[0].defaultMessage ?: payer.errors.allErrors[0].codes[0])] as JSON)
                return
            }
            
            render([success: true] as JSON)
        } catch (Exception e) {
            e.printStackTrace()
            render([success: false, message: message(code: "occurrence.error")] as JSON)
        }
    }

    def show() {
        return [payer: Payer.get(params.long("payerId"))]
    }
}