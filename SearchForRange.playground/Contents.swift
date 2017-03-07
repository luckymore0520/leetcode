//: Playground - noun: a place where people can play

import UIKit

//Given an array of integers sorted in ascending order, find the starting and ending position of a given target value.
//
//Your algorithm's runtime complexity must be in the order of O(log n).
//
//If the target is not found in the array, return [-1, -1].
//
//For example,
//Given [5, 7, 7, 8, 8, 10] and target value 8,
//return [3, 4].


//二分

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let location = binarySearch(nums, target, start: 0, end: nums.count-1)
        //左边的
        var left = location
        while (true) {
            let result = binarySearch(nums, target, start: 0, end: left - 1)
            if (result == -1) {
                break;
            } else {
                left = result
            }
        }
        
        var right = location
        while (true) {
            let result = binarySearch(nums, target, start: right+1, end: nums.count-1)
            if (result == -1) {
                break;
            } else {
                right = result
            }
        }
        
        
        return [left,right]
    }
    
    func binarySearch(_ nums:[Int], _ target:Int, start:Int, end:Int) -> Int {
        if (start > end) {
            return -1
        }
        let middle = (start + end) / 2
        if (nums[middle] > target) {
            return binarySearch(nums, target, start: start, end: middle-1)
        } else if (nums[middle] < target) {
            return binarySearch(nums, target, start: middle + 1, end: end)
        } else {
            return middle
        }
    }
}

let solution = Solution()
solution.searchRange([5,7,7,8,8,10], 7)