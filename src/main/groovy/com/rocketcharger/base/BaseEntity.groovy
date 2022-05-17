package com.rocketcharger.base

abstract class BaseEntity {

    Boolean deleted = false
    
    Date dateDeleted

    Date dateCreated = new Date()

    Date lastUpdated = dateCreated


    static mapping = {
        tablePerHierarchy false
    }

    static constraints = {
        lastUpdated nullable: true
        dateCreated nullable: true
        deleted nullable: true
    }
}
