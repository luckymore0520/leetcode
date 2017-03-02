//: Playground - noun: a place where people can play

import UIKit

//Given an array and a value, remove all instances of that value in place and return the new length.
//
//Do not allocate extra space for another array, you must do this in place with constant memory.
//
//The order of elements can be changed. It doesn't matter what you leave beyond the new length.
//
//Example:
//Given input array nums = [3,2,2,3], val = 3
//
//Your function should return length = 2, with the first two elements of nums being 2.



class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if (nums.count == 0) {
            return 0
        }
        var length = 0
        for i in 0...nums.count-1 {
            if (nums[i] != val) {
                nums[length] = nums[i]
                length += 1
            }
        }
        return length
    }
}