package com.rocketcharger.domain

import grails.validation.ValidationException
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

import com.rocketcharger.domain.User
import com.rocketcharger.domain.Role
import com.rocketcharger.domain.UserRole
import com.rocketcharger.domain.CustomUserDetails

@Transactional
@Secured('permitAll')
class RegisterController {

    static allowedMethods = [register: "POST"]

    def index() { }

    def register() {
        if(!params.password.equals(params.repassword)) {
            flash.message = "Password and Re-Password not match"
            redirect action: "index"
            return
        } 
            def user = User.findByUsername(params.username)?: new User(username: params.username, password: params.password).save()
            def role = Role.get(params.role.id)
            if(user && role) {
                UserRole.create user, role

                UserRole.withSession {
                    it.flush()
                    it.clear()
                }

                flash.message = "You have registered successfully. Please login."
                redirect controller: "login", action: "auth"
        } 
        }
    }