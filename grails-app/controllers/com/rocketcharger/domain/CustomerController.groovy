package com.rocketcharger.domain

import com.rocketcharger.domain.customer.Customer
import com.rocketcharger.domain.PaymentService
import com.rocketcharger.domain.DashboardService
import com.rocketcharger.base.BaseController
import grails.validation.ValidationException
import grails.converters.JSON
import static org.springframework.http.HttpStatus.*

class CustomerController extends BaseController {
    
    def dashboardService
    def customerService

    def create() {}

    def save() {
        try {
            Customer customer = customerService.save(params)

            if (customer.hasErrors()) {
                render([success: false, message: message(code: customer.errors.allErrors[0].defaultMessage ?: customer.errors.allErrors[0].codes[0])] as JSON)
                return
            }

            render([success: true] as JSON)
        } catch(Exception e) {
            render([success: false, message: message(code: "occurrence.error")] as JSON)
        }
    }

    def update() {
        try {
            Customer customer = customerService.update(params)

            if (customer.hasErrors()) {
                render([success: false, message: message(code: customer.errors.allErrors[0].defaultMessage ?: customer.errors.allErrors[0].codes[0])] as JSON)
                return
            }

            render([success: true] as JSON)
        } catch(Exception e) {
            render([success: false, message: message(code: "occurrence.error")] as JSON)
        } 
    }

    def show() {
        Customer customer = Customer.get(params.customerId)
        return [customer: customer]
    }

    def list() {
        Customer customer = Customer.get(params.customerId)
        return [customerList: Customer.list(max: getSizeLimitPage(), offset: getCurrentPage()), customer: customer, totalCount: Customer.count()]
    }
 }