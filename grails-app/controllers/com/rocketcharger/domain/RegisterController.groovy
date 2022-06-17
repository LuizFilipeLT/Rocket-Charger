package com.rocketcharger.domain

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import static org.springframework.http.HttpStatus.*
import grails.converters.JSON

import com.rocketcharger.domain.User
import com.rocketcharger.domain.Role
import com.rocketcharger.domain.UserRole
import com.rocketcharger.domain.CustomUserDetails
import com.rocketcharger.domain.customer.Customer

@Transactional
@Secured('permitAll')
class RegisterController {

    def registerService

    static allowedMethods = [register: "POST"]

    def index() {}

    def register() {
        if(!params.password.equals(params.repassword)) {
            flash.message = "Password and Re-Password not match"
            redirect action: "index"
            return
        } 
            registerService.register(params)
            flash.message = "You have registered successfully. Please login."
            redirect controller: "login", action: "auth"
        } 
    }