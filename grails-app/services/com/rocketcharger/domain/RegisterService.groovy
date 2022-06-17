package com.rocketcharger.domain

import com.rocketcharger.domain.User
import com.rocketcharger.domain.Role
import com.rocketcharger.domain.UserRole
import com.rocketcharger.domain.CustomUserDetails
import com.rocketcharger.domain.customer.Customer

import grails.validation.ValidationException
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Transactional
class RegisterService {

    public User register(Map params) {
        Customer customer = createtCustomer(params.username)
        User user = createtUser(params.username, params.password, customer)
        createtRoleUser(user)
        return user
    }

    public User createtUser(String username, String password, Customer customer) {
        User user = new User()
        user.username = username
        user.password = password
        user.customer = customer
        user.save(flush: true, failOnError: true)
        return user
    }

    public Customer createtCustomer(String email) {
        Customer customer = new Customer()
        customer.email = email
        customer.save(flush: true, failOnError: true)
    }

    public UserRole createtRoleUser(User user) {
        def role = Role.get(2)
        UserRole.create(user, role)
        UserRole.withSession {
            it.flush()
            it.clear()
        }
    }

}

