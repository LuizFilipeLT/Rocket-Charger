package com.rocketcharger.domain

import com.rocketcharger.domain.payer.Payer
import com.rocketcharger.domain.customer.Customer
import grails.gorm.transactions.Transactional

@Transactional
class PayerService {

    public Payer save(Map params) {
        Customer customer = Customer.get(params.long("id"))
        Payer payer = new Payer(params)
        payer.customer = customer
        payer.save(failOnError: true)
        return payer
    }

    public List<Payer> index() {
        return Payer.getAll()
    }

    public Payer getPayer(Long id) {
        return Payer.get(id)
    }

    public Payer update(Map params) {
        if (!params.id) return
        Payer payer = Payer.get(params.long("id"))
        payer.name = params.name
        payer.email = params.email
        payer.cpfCnpj = params.cpfCnpj
        payer.postalCode = params.postalCode
        payer.address = params.address
        payer.district = params.district
        payer.city = params.city
        payer.state = params.state
        payer.save(flush: true, failOnError: true)
        return payer
    }

    public List<Payer> returnPayersByCustomer(Long customerId, Integer max = null, Integer offset = null) {
        def payerCriteria = Payer.createCriteria()
        if (max == null || offset == null) {
            List<Payer> payerList = payerCriteria.list() {
                eq("customer", Customer.get(customerId))
            }
            return payerList
        }
        List<Payer> payerList = payerCriteria.list(max: max, offset: offset) {
            eq("customer", Customer.get(customerId))
        }
        return payerList
    }
}