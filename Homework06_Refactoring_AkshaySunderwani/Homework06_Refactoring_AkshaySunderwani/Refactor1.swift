//
//  Refactor1.swift
//  Homework06_Refactoring_AkshaySunderwani
//
//  Created by AKSHAY SUNDERWANI on 11/10/16.
//  Copyright © 2016 AKSHAY SUNDERWANI. All rights reserved.
//


//Note: First Refactoring of code, by using methods to compare the dates

import Foundation

class Refactor1 {
    
    class func convertStringDateToNSDate(date: String) -> Date! {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let dateToCompare = dateFormatter.date(from: date)
        if dateToCompare != nil{
            return dateToCompare!
        }
        
        return nil
    }

    class func getDays(date_to_compare : String, date1 : String, date2 : String) -> Dictionary<String, Dictionary<String, Int>> {
        
        let cal = Calendar.current
        
        let dateToCompare = convertStringDateToNSDate(date: date_to_compare)
        let targetDate1 = convertStringDateToNSDate(date: date1)
        let targetDate2 = convertStringDateToNSDate(date: date2)
        
        let unitFlags = Set<Calendar.Component>([.day])
        
        var days_dict1 = ["days" : 0, "months" : 0, "years" : 0]
        var days_dict2 = ["days" : 0, "months" : 0, "years" : 0]

        if dateToCompare != nil && targetDate1 != nil{
            let diff1 = cal.dateComponents(unitFlags, from: dateToCompare!, to: targetDate1!)
            let day1 = abs(diff1.day!)
            days_dict1 = ["days" : day1, "months" : (Int(Float(day1)/30.4)), "years" : (Int(Float(day1)/365.25))]
        }else{
            print("ERROR: Format of date is not proper!!!!")
        }

        if dateToCompare != nil && targetDate2 != nil{
            let diff2 = cal.dateComponents(unitFlags, from: dateToCompare!, to: targetDate2!)
            let day2 = abs(diff2.day!)
            days_dict2 = ["days" : day2, "months" : (Int(Float(day2)/30.4)), "years" : (Int(Float(day2)/365.25))]
        }else{
            print("ERROR: Format of date is not proper!!!!")
        }

        let dict = ["date1" : days_dict1, "date2" : days_dict2]

        return dict
        
    }
    
    class func checkDates() {
        
        let date_arr = ["2010-01-15","2012-6-29","1953-2-23","1969-3-29","1994-8-24"]

        for dates in date_arr{
            
            let dict = getDays(date_to_compare: dates, date1 : "2000-01-01", date2 : "2016-10-03")
            
            print("THE NUMBER OF DAYS BETWEEN DATE : \(dates) AND 2000-01-01 : \(dict["date1"]?["days"]) MONTH : \(dict["date1"]?["months"]) YEAR : \(dict["date1"]?["years"])" )

            print("THE NUMBER OF DAYS BETWEEN DATE : \(dates) AND 2016-10-03 : \(dict["date2"]?["days"]) MONTH : \(dict["date2"]?["months"]) YEAR : \(dict["date2"]?["years"])" )
            
        }
    }
}
