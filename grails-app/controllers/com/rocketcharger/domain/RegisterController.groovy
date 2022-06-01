package com.rocketcharger.domain

import grails.validation.ValidationException
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import com.rocketcharger.domain.user.User
import com.rocketcharger.domain.role.Role
import com.rocketcharger.domain.userRole.UserRole

@Transactional
@Secured('permitAll')
class RegisterController {

    static allowedMethods = [register: "POST"]

    def index() { }

    def register() {
        print params
        try {
            def user = User.findByUsername(params.username)?: new User(username: params.username, password: params.password, fullname: params.fullname).save()
            def role = Role.get(params.role.id)
            if(user && role) {
                UserRole.create user, role

                UserRole.withSession {
                    it.flush()
                    it.clear()
                }

                flash.message = "Registrado com sucesso."
                redirect controller: "login", action: "auth"
            } 
        } catch (ValidationException e) {
                flash.message = "registro falhou"
                redirect action: "index"
                return
        }
    }
}
