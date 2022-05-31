package com.rocketcharger.domain.role

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic
import com.rocketcharger.domain.role.Role
import com.rocketcharger.domain.userRole.UserRole
import com.rocketcharger.domain.user.User

@GrailsCompileStatic
@EqualsAndHashCode(includes='authority')
@ToString(includes='authority', includeNames=true, includePackage=false)
class Role implements Serializable {

	private static final long serialVersionUID = 1

	String authority

	static constraints = {
		authority nullable: false, blank: false, unique: true
	}

	static mapping = {
		cache true
	}
	
	String toString() {
		authority
	}
}
