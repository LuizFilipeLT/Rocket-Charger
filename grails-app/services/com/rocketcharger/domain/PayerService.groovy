package com.rocketcharger.domain

import com.rocketcharger.domain.payer.Payer
import com.rocketcharger.domain.customer.Customer
import com.rocketcharger.utils.DomainUtils
import com.rocketcharger.utils.ValidateUtils
import grails.gorm.transactions.Transactional

@Transactional
class PayerService {

    public Payer save(Map params) {
        Customer customer = Customer.get(params.long("customerId"))
        Payer payer = new Payer()
        payer = validate(payer, params)
        if (payer.hasErrors()) return payer
        payer.customer = customer
        payer.name = params.name
        payer.phone = params.phone
        payer.email = params.email
        payer.cpfCnpj = params.cpfCnpj
        payer.postalCode = params.postalCode
        payer.address = params.address
        payer.addressNumber = params.addressNumber
        payer.district = params.district
        payer.city = params.city
        payer.state = params.state
        payer.save(failOnError: true)
        return payer
    }
    
    public List<Payer> index() {
        return Payer.getAll()
    }

    public Payer update(Map params) {
        if (!params.id) DomainUtils.addError(payer, "")
        Payer payer = Payer.get(params.long("id"))
        payer = validate(payer, params)
        if (payer.hasErrors()) return payer
        payer.name = params.name
        payer.phone = params.phone
        payer.email = params.email
        payer.cpfCnpj = params.cpfCnpj
        payer.postalCode = params.postalCode
        payer.address = params.address
        payer.addressNumber = params.addressNumber
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

    public Payer validate(Payer payer, Map params) {
        if (!ValidateUtils.isNotNull(params.name)) {
            DomainUtils.addError(payer, "")
        }
        if (!ValidateUtils.emailIsValid(params.email)) {
            DomainUtils.addError(payer, "")
        }
        if (!ValidateUtils.validateCpfCnpj(params.cpfCnpj)) {
            DomainUtils.addError(payer, "")
        }
        if (!ValidateUtils.validatePostalCode(params.postalCode)) {
            DomainUtils.addError(payer, "")
        }
        if (!ValidateUtils.isNotNull(params.address)) {
            DomainUtils.addError(payer, "")
        }
        if (!ValidateUtils.isNotNull(params.addressNumber)) {
            DomainUtils.addError(payer, "")
        }
        if (!ValidateUtils.isNotNull(params.district)) {
            DomainUtils.addError(payer, "")
        }
        if (!ValidateUtils.isNotNull(params.city)) {
            DomainUtils.addError(payer, "")
        }
        if (!ValidateUtils.isNotNull(params.state)) {
            DomainUtils.addError(payer, "")
        }
        return payer
    }
}