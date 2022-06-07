package com.rocketcharger.base

abstract class BaseController {

    private Integer getSizeLimitPage() {
        return 10
    }

    private Integer getCurrentPage() {
        if (!params.offset) params.offset = 0
        return Integer.valueOf(params.offset)
    }

    static mapping = {
        tablePerHierarchy false
    }
}