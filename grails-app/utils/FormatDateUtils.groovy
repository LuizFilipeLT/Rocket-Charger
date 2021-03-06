package com.rocketcharger.utils

import java.text.SimpleDateFormat

class FormatDateUtils{
    
    public static Date toDate(String date, String pattern) {
        SimpleDateFormat formatDate = new SimpleDateFormat(pattern)
        return formatDate.parse(date)
    }

    public static Date getYesterdayDate() {
        return new Date().clearTime().previous()
    }
}