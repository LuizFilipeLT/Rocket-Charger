package com.rocketcharger.domain

import com.rocketcharger.domain.customer.Customer
import com.rocketcharger.domain.PaymentService
import com.rocketcharger.domain.DashboardService
import com.rocketcharger.base.BaseController
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class DashboardController extends BaseController {

    def dashboardService

    def index() {
        Customer customer = getCurrentCustomer()
        Map dashboard = dashboardService.returnDashboardValues(customer) 
        return [customer: customer, dashboard: dashboard]
    }
}