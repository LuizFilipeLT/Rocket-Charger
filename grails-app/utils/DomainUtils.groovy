package com.rocketcharger.utils

    class DomainUtils {

        public static Object addError(Object entity, String message) {
        entity.errors.reject("", null, "Ocorreu um erro, contate o administrador.")
        return entity
    }
}