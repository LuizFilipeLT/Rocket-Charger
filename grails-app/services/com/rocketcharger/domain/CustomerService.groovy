package com.rocketcharger.domain

import com.rocketcharger.domain.customer.Customer
import com.rocketcharger.utils.DomainUtils
import com.rocketcharger.utils.ValidateUtils
import grails.gorm.transactions.Transactional 

@Transactional
class CustomerService {

    public Customer save(Map params) {
        Customer customer = new Customer()
        customer = validate(customer, params)
        if (customer.hasErrors()) return customer
        customer.name = params.name
        customer.email = params.email
        customer.phone = params.phone
        customer.cpfCnpj = params.cpfCnpj
        customer.postalCode = params.postalCode
        customer.address = params.address
        customer.addressNumber = params.addressNumber
        customer.district = params.district
        customer.city = params.city
        customer.state = params.state
        customer.save(failOnError: true)
        return customer
    }

    public List<Customer> index() {
        return Customer.getAll()
    }

    public Customer update(Map params){
        Customer customer = Customer.get(params.long("id"))
        customer = validate(customer, params)
        if (customer.hasErrors()) return customer
        customer.name = params.name
        customer.phone = params.phone
        customer.email = params.email
        customer.cpfCnpj = params.cpfCnpj
        customer.postalCode = params.postalCode
        customer.address = params.address
        customer.addressNumber = params.addressNumber
        customer.number = params.number
        customer.district = params.district
        customer.city = params.city
        customer.state = params.state
        customer.save(failOnError: true)
        return customer
    }

    public Customer validate(Customer customer, Map params) {
        if (!ValidateUtils.isNotNull(params.name)) {
            DomainUtils.addError(customer, "")
        }
        if (!ValidateUtils.emailIsValid(params.email)) {
            DomainUtils.addError(customer, "")
        }
        if (!ValidateUtils.validateCpfCnpj(params.cpfCnpj)) {
            DomainUtils.addError(customer, "")
        }
        if (!ValidateUtils.validatePostalCode(params.postalCode)) {
            DomainUtils.addError(customer, "")
        }
        if (!ValidateUtils.isNotNull(params.address)) {
            DomainUtils.addError(customer, "")
        }
        if (!ValidateUtils.isNotNull(params.addressNumber)) {
            DomainUtils.addError(customer, "")
        }
        if (!ValidateUtils.isNotNull(params.district)) {
            DomainUtils.addError(customer, "")
        }
        if (!ValidateUtils.isNotNull(params.city)) {
            DomainUtils.addError(customer, "")
        }
        if (!ValidateUtils.isNotNull(params.state)) {
            DomainUtils.addError(customer, "")
        }
        return customer
    } 
}