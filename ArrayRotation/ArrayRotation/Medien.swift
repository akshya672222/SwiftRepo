//
//  Medien.swift
//  ArrayRotation
//
//  Created by AKSHAY SUNDERWANI on 20/10/16.
//  Copyright © 2016 AKSHAY SUNDERWANI. All rights reserved.
//

import Foundation

class Medien {
    class func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        let new_arr = nums1 + nums2
        
        let sorted_new_arr = new_arr.sorted {
            return $0 < $1
        }
        
        if (nums1.count + nums2.count) % 2 == 0 {
            let n1 = (nums1.count + nums2.count)/2
            return Double(Float((sorted_new_arr[n1-1]+sorted_new_arr[n1]))/2)
        } else {
            let n1 = ((nums1.count + nums2.count)/2) + 1
            return Double(sorted_new_arr[n1-1])
        }
        
    }
}
