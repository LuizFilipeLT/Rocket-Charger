package com.rocketcharger.domain

import com.rocketcharger.domain.payer.Payer

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.converters.JSON

class PayerController {
    def payerService

    def index() {  
       return [payerList: Payer.getAll()]
    }

    def create() { }

    def save () {
        try {
            payerService.save(params)
            render([success: true] as JSON)
        } catch(Exception e) {
            render([success: false, message: "Ocorreu um erro"] as JSON)
        } 
    }
}
