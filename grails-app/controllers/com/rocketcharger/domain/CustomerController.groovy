package com.rocketcharger.domain

import com.rocketcharger.base.BaseController
import com.rocketcharger.domain.customer.Customer
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.validation.ValidationException
import grails.converters.JSON

class CustomerController extends BaseController {
    
    def customerService

    def index() {
        return [customerList: Customer.list(max: returnSizeLimitPage(), offset: getCurrentPage()), totalCount: Customer.count()]
    }

    def create() {}

    def save() {
        try {
            Customer customer = customerService.save(params)
            render([success: true] as JSON)
        } catch(Exception e) {
            render([success: false, message: message(code: "occurrence.error")] as JSON)
        }
    }

    def update() {
       try {
            Long id = params.long("id")
            customerService.update(id, params)
            render([success: true] as JSON)
        } catch(Exception e) {
            render([success: false, message: message(code: "occurrence.error")] as JSON)
        } 
    }

    def show() {
        return [customer: Customer.get(params.long("id"))]
    }

    def list() {
        return [customerList: Customer.list(max: returnSizeLimitPage(), offset: getCurrentPage()), totalCount: Customer.count()]
    }
 }