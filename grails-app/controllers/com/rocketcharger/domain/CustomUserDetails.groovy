package com.rocketcharger.domain

import grails.plugin.springsecurity.userdetails.GrailsUser
import org.springframework.security.core.GrantedAuthority
import com.rocketcharger.domain.User
import com.rocketcharger.domain.Role
import com.rocketcharger.domain.UserRole
import com.rocketcharger.domain.customer.Customer
import com.rocketcharger.domain.CustomUserDetails

class CustomUserDetails extends GrailsUser {

   CustomUserDetails(String username, 
                     String password, 
                     boolean enabled,
                     boolean accountNonExpired, 
                     boolean credentialsNonExpired,
                     boolean accountNonLocked,
                     Collection<GrantedAuthority> authorities,
                     long id) {
      super(username, password, enabled, accountNonExpired,
            credentialsNonExpired, accountNonLocked, authorities, id)
   }
}
