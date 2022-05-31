package com.rocketcharger.domain

import grails.plugin.springsecurity.userdetails.GrailsUser
import org.springframework.security.core.GrantedAuthority
import com.rocketcharger.domain.role.Role
import com.rocketcharger.domain.userRole.UserRole
import com.rocketcharger.domain.user.User

class CustomUserDetails extends GrailsUser {

   final String fullname

   CustomUserDetails(String username, String password, boolean enabled,
                 boolean accountNonExpired, boolean credentialsNonExpired,
                 boolean accountNonLocked,
                 Collection<GrantedAuthority> authorities,
                 long id, String fullname) {
      super(username, password, enabled, accountNonExpired,
            credentialsNonExpired, accountNonLocked, authorities, id)

      this.fullname = fullname
   }
}