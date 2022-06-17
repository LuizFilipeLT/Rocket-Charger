package com.rocketcharger.base

import com.rocketcharger.domain.customer.Customer

abstract class BaseController {

    def springSecurityService

    protected Integer getSizeLimitPage() {
        return 10
    }

    protected Integer getCurrentPage() {
        if (!params.offset) params.offset = 0
        return Integer.valueOf(params.offset)
    }

    protected Customer getCurrentCustomer() {
        return springSecurityService.currentUser.customer
    }

    static mapping = {
        tablePerHierarchy false
    }
}