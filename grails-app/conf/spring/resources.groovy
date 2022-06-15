import com.rocketcharger.domain.UserPasswordEncoderListener
import com.rocketcharger.domain.CustomUserDetailsService

beans = {
    userPasswordEncoderListener(UserPasswordEncoderListener)
    userDetailsService(CustomUserDetailsService)
}