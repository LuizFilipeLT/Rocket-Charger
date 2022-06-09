package com.rocketcharger.utils

import java.text.SimpleDateFormat
import java.text.DateFormat;
import java.util.Date;

class FormatDateUtils{

    public static void main(String args) {
        Date now = new Date();

        DateFormat currentDate = DateFormat.getDateInstance();

        Date addedDate = addDays(now, 30);
    }

    public static Date addDays(Date d, int days) {
        d.setTime(d.getTime() + days * 1000 * 60 * 60 * 24);
        return d;
    }
    
    public static Date toDate(String date, String pattern) {
        SimpleDateFormat formatDate = new SimpleDateFormat(pattern)
        return formatDate.parse(date)
    }

    public static Date getYesterdayDate() {
        return new Date().clearTime().previous()
    }
}