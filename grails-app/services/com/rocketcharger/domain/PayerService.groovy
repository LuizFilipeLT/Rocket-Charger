package com.rocketcharger.domain

import com.rocketcharger.domain.payer.Payer
import com.rocketcharger.domain.customer.Customer
import com.rocketcharger.utils.DomainUtils
import com.rocketcharger.utils.ValidateUtils
import grails.gorm.transactions.Transactional

@Transactional
class PayerService {

    public Payer save(Customer customer, Map params) {
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
        if (!params.payerId) DomainUtils.addError(payer, "")
        Payer payer = Payer.get(params.long("payerId"))
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

    public List<Payer> returnPayersByCustomer(Long customerId, Integer max, Integer offset) {
        def payerCriteria = Payer.createCriteria()
        List<Payer> payerList = payerCriteria.list(max: max, offset: offset) {
            eq("customer", Customer.get(customerId))
        }
        return payerList
    }

    public Payer validate(Payer payer, Map params) {
        if (!ValidateUtils.isNotNull(params.name)) {
            DomainUtils.addError(payer, "O campo nome é obrigatório")
        }
        if (!ValidateUtils.emailIsValid(params.email)) {
            DomainUtils.addError(payer, "O campo email é obrigatório")
        }
        if (!ValidateUtils.validateCpfCnpj(params.cpfCnpj)) {
            DomainUtils.addError(payer, "O campo CPF/CNPJ é obrigatório")
        }
        if (!ValidateUtils.validatePostalCode(params.postalCode)) {
            DomainUtils.addError(payer, "O campo CEP é obrigatório")
        }
        if (!ValidateUtils.isNotNull(params.address)) {
            DomainUtils.addError(payer, "O campo endereço é obrigatório")
        }
        if (!ValidateUtils.isNotNull(params.addressNumber)) {
            DomainUtils.addError(payer, "O campo número é obrigatório")
        }
        if (!ValidateUtils.isNotNull(params.district)) {
            DomainUtils.addError(payer, "O campo bairro é obrigatório")
        }
        if (!ValidateUtils.isNotNull(params.city)) {
            DomainUtils.addError(payer, "O campo cidade é obrigatório")
        }
        if (!ValidateUtils.isNotNull(params.state)) {
            DomainUtils.addError(payer, "O campo estado é obrigatório")
        }
        return payer
    }
}