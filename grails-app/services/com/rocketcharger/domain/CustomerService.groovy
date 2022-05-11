package com.rocketcharger.domain

import com.rocketcharger.domain.customer.Customer
import grails.gorm.transactions.Transactional 

@Transactional
class CustomerService {

     def save(Map params) {
         Customer customer = new Customer(params)
         customer.save(failOnError: true)
     }

      def index() {
        return Customer.getAll()
    }

    def getCustomer(Integer id){
        return Customer.get(id)
    }

    def update(Map params){
        if (!params.id) {
            return;
       } 
            Customer customer = Customer.get(params.int("id"))
            customer.name = params.name
            customer.email = params.email
            customer.cpfCnpj = params.cpfCnpj
            customer.postalCode = params.postalCode
            customer.address = params.address
            customer.district = params.district
            customer.city = params.city
            customer.state = params.state
            customer.save(flush: true, failOnError: true)
    } 

    private void validate(Map params){
        if(params.cpfCnpj == !null){
            throw new Exception('CPF/CNPJ já existente')
        }
    }
}