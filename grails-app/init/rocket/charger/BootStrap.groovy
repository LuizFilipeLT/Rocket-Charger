package rocket.charger

import com.rocketcharger.domain.User
import com.rocketcharger.domain.Role
import com.rocketcharger.domain.UserRole

class BootStrap {

    def init = { servletContext ->
        new Role(authority:"ROLE_ADMIN").save()
        new Role(authority:"ROLE_USER").save()
    }
    def destroy = {
    }
}