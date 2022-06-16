package rocket.charger

class CustomerTagLib {

    static namespace = "customerTagLib"
    static returnObjectForTags = ["getCurrentCustomer"]

    def springSecurityService

    def getCurrentCustomer = {
       return springSecurityService.currentUser.customer
    }
}