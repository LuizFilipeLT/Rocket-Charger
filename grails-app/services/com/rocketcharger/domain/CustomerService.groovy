package com.rocketcharger.domain

import com.rocketcharger.domain.customer.Customer
import grails.gorm.transactions.Transactional 

@Transactional
class CustomerService {

    public Customer save(Map params) {
         Customer customer = new Customer(params)
         customer.save(failOnError: true)
         return customer
    }

    public List<Customer> index() {
        return Customer.getAll()
    }

    public Customer getCustomer(Long customerId){
        return Customer.get(params.long(customerId))
    }

    public Customer update(Map params){
        Customer customer = Customer.get(params.long("customerId"))
        customer.name = params.name
        customer.email = params.email
        customer.cpfCnpj = params.cpfCnpj
        customer.postalCode = params.postalCode
        customer.address = params.address
        customer.district = params.district
        customer.city = params.city
        customer.state = params.state
        customer.save(failOnError: true)
        return customer
    } 
}