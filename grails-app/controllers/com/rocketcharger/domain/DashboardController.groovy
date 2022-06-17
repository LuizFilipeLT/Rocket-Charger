package com.rocketcharger.domain

import com.rocketcharger.domain.customer.Customer
import com.rocketcharger.domain.PaymentService
import com.rocketcharger.domain.DashboardService

class DashboardController {

    def dashboardService

    def index() {
        Long customerId = params.long("customerId")
        Map dashboard = dashboardService.returnDashboardValues(customerId) 
        return [customer: Customer.get(customerId), dashboard: dashboard]
    }
}