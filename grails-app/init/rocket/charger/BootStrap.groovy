package rocket.charger
import com.rocketcharger.domain.user.User
import com.rocketcharger.domain.role.Role
import com.rocketcharger.domain.userRole.UserRole

class BootStrap {

    def init = { servletContext ->
    new Role(authority:"ROLE_ADMIN").save()
    new Role(authority:"ROLE_USER").save()
    }
    def destroy = {
    }
}
