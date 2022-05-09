package com.rocketcharger.domain

import com.rocketcharger.domain.customer.Customer

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.converters.JSON

class CustomerController {
     def customerService

     
   def index() {  
        return [customerList: Customer.list(max: 10, offset: getCurrentPage()), totalCount: Customer.count()]
    }

    def validateCpfCnpj = new validateCpfCnpj(customer, params)
    if (!validateCpfCnpj.validate()) {
        validateCpfCnpj.errors.allErrors.each {
            println it
        }
    }
    def create() {
        // return [customerValidate: getCurrentValidate()]
    }
        // private getCurrentValidate(customer, Map params) {
        // if(!${customer.cpfCnpj} == null) 
        // alert('nao tem')
        // return;
        // }

    def save() {
        try {
            customerService.save(params)
            render([success: true] as JSON)
        } catch(Exception e) {
            render([success: false, message: "Ocorreu um erro"] as JSON)
        } 
    }

    def update() {
       try {
            customerService.update(params)
            render([success: true] as JSON)
        } catch(Exception e) {
            render([success: false, message: "Erro ao tentar atualizar"] as JSON)
        } 
    }

    def show() {
        return [customer: customerService.getCustomer(params.int("id"))]
    }
    
    private Integer getCurrentPage() {
        if(!params.offset) params.offset = 0
        return Integer.valueOf(params.offset)
    }
 }
