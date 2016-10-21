//
//  ArrayRotation.swift
//  ArrayRotation
//
//  Created by AKSHAY SUNDERWANI on 20/10/16.
//  Copyright © 2016 AKSHAY SUNDERWANI. All rights reserved.
//

import Foundation

extension String {
    var condensedWhitespace: String {
        let components = self.components(separatedBy: NSCharacterSet.whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
}

class ArrayRotation {
 
    class func checkIfArrayElementsAreInteger(_ array_to_check : NSMutableArray ) -> Bool {
        
        for items in array_to_check {
            let check = items as! NSString
            let check2 = Int(check as String)
            if check2 == nil{
                return false
            }
        }
        return true
    }
    
    class func readInput() -> NSMutableArray{
        var response = readLine(strippingNewline: true)
        response = response?.condensedWhitespace
        return NSMutableArray(array: (response?.components(separatedBy: " "))!)
    }
    
    class func rotateArrayAccordingToType(number_of_rotation : Int, type_of_rotation : String, components_array: NSMutableArray) -> NSMutableArray {
        
        var i = 1
        
        if type_of_rotation == "left" {
            while i <= number_of_rotation {
                var j = 0
                let value = components_array[j]
                while j < components_array.count - 1 {
                    components_array.replaceObject(at: j, with: components_array[j+1])
                    j += 1
                }
                components_array.replaceObject(at: j, with: value)
                i += 1
            }
        }else if type_of_rotation == "right"{
            while i <= number_of_rotation {
                var j = components_array.count - 1
                let value = components_array[j]
                while j > 0 {
                    components_array.replaceObject(at: j, with: components_array[j-1])
                    j -= 1
                }
                components_array.replaceObject(at: j, with: value)
                i += 1
            }
        }
        
        return components_array

    }
    
    class func rotateArray() -> NSMutableArray! {
        
        print("Enter length of array (greater than 1 and less than 10^5) and number of rotation (greater than 1 and less than length of array) by space separated : ")
        let componentsMutableArray = readInput()
        
        if (componentsMutableArray.count) == 2 {
            
            if checkIfArrayElementsAreInteger(componentsMutableArray) {
               
                let length_of_array = Int((componentsMutableArray[0] as! NSString) as String)
                let number_of_rotation = Int((componentsMutableArray[1] as! NSString) as String)
                
                if (1 <= length_of_array! && length_of_array! <= 10^5) && (1 <= number_of_rotation! && number_of_rotation! <= length_of_array!) {
                
                    print("Enter ",length_of_array!, " elements for array space separated :")
                    let components_array = readInput()
                    
                    if components_array.count == length_of_array {
                        return rotateArrayAccordingToType(number_of_rotation: number_of_rotation!, type_of_rotation: "right", components_array: components_array)
                    }else{
                        print("Entered number of elements are not same as array length...!!!")
                    }

                }else{
                    print("Values enter does not match input criteria...!!!")
                }
                
            }else{
                print("Input Is Not A Valid Integer...!!!")
            }
            
        }else{
            print("Only two inputs are expected....!!!!")
        }
        
        return nil
    }
    
}

