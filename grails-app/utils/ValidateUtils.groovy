package com.rocketcharger.utils

import com.rocketcharger.domain.customer.Customer
import com.rocketcharger.domain.payer.Payer

import groovy.json.JsonSlurper
import java.lang.String
import java.math.BigDecimal
import java.net.URL.*
import org.apache.commons.validator.routines.EmailValidator

class ValidateUtils {

    public static Boolean emailIsValid(String email) {
        return email ==~ /[A-Za-z0-9_\%\+-]+(\.[A-Za-z0-9_\%\+-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*(\.[A-Za-z]{2,15})/
    }

    public static String isNumeric(String string) {
        if (string == null) return null
        return string?.replaceAll("[^0-9]", '')
    }

    public static Boolean validateNotNull(String parameter) {
        if (parameter != null) {
            return true
        }
        return false
    }

    public static Boolean validateCpfCnpj(String cpfCnpj) {
        String cleanCpfCnpj = isNumeric(cpfCnpj)
        if (cleanCpfCnpj != null && cleanCpfCnpj.length() ==  11 || cleanCpfCnpj.length() ==  14) {
            return true
        }
        return false
    }

    public static Boolean validatePostalCode(String postalCode) {
        String cleanPostalCode = isNumeric(postalCode)
        if (cleanPostalCode != null && cleanPostalCode.length() == 8) {
            def get = new URL("https://viacep.com.br/ws/" + cleanPostalCode + "/json/").openConnection()
            def sluper = new JsonSlurper()
            def getResponse = sluper.parseText(get.content.text)
            if (getResponse.erro) return false 
            return true
        }
        return false
    }
}