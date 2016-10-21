//
//  Refactor2.swift
//  Homework06_Refactoring_AkshaySunderwani
//
//  Created by AKSHAY SUNDERWANI on 11/10/16.
//  Copyright © 2016 AKSHAY SUNDERWANI. All rights reserved.
//

// Note: Second refactoring of code, Removed the redundancy of if statement for nil check if date format is not as expected, and reduced the unnecessary methods

import Foundation

class Refactor2 {
    
    class func getDays(date_to_compare : String, date : String) -> Int {
        
        let cal = Calendar.current
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let dateToCompare = dateFormatter.date(from: date_to_compare)
        let targetDate = dateFormatter.date(from: date)
        
        var days = 0
        
        if dateToCompare != nil && targetDate != nil{
            let unitFlags = Set<Calendar.Component>([.day])
            let diff = cal.dateComponents(unitFlags, from: dateToCompare!, to: targetDate!)
            days = abs(diff.day!)
        }else{
            print("ERROR: Format of date is not proper!!!!")
        }
        
        return days
        
    }
    
    class func checkDates() {
        
        let date_arr = ["2010-01-15","2012-6-29","1953-2-23","1969-3-29","1994-8-24"]
        
        let date1 = "2000-01-01"
        let date2 = "2016-10-03"
        
        for dates in date_arr{
            
            let days = getDays(date_to_compare: dates, date: date1)
            printDates(date1: dates, date2: date1, days: days)
            
            let days2 = getDays(date_to_compare: dates, date: date2)
            printDates(date1: dates, date2: date2, days: days2)

        }
    }
    
    class func printDates(date1 : String, date2 : String, days : Int){
      
        print("THE NUMBER OF DAYS BETWEEN DATE : \(date1) AND \(date2) : \(days) MONTH : \(Int(Float(days)/30.4)) YEAR : \(Int(Float(days)/365.25))" )

    }
}

