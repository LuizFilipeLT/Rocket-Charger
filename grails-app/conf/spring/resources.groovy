import com.djamware.UserPasswordEncoderListener
import com.rocketcharger.domain.CustomUserDetailsService

beans = {
    userPasswordEncoderListener(UserPasswordEncoderListener)
    userDetailsService(CustomUserDetailsService)
}