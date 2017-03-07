//: Playground - noun: a place where people can play

import UIKit

//Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
//
//(i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
//
//You are given a target value to search. If found in the array return its index, otherwise return -1.
//
//You may assume no duplicate exists in the array.
//
//Subscribe to see which companies asked this question.


class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if (nums.count == 0) {
            return -1
        }
        var middle = findPartition(nums, start: 0, end: nums.count-1)
        if (middle == -1) {
            middle = nums.count - 1
        }
        if (nums[0] > target) {
            return binarySearch(nums, target, start: middle+1, end: nums.count-1)
        } else {
            return binarySearch(nums, target, start: 0, end: middle)
        }
    }
    
    func findPartition(_ nums:[Int], start:Int, end:Int) -> Int{
        if (start > end) {
            return -1
        }
        let middle = (start + end) / 2
        if (middle + 1 < nums.count && nums[middle] > nums[middle+1]) {
            return middle
        } else {
            return max(findPartition(nums, start: start, end: middle-1),findPartition(nums, start: middle+1, end: end))
        }
        
    }
    
    
    
    
    
    func binarySearch(_ nums:[Int], _ target:Int, start:Int, end:Int) -> Int {
        if (start > end) {
            return -1
        }
        let middle = (start + end) / 2
        if (nums[middle] > target) {
            return binarySearch(nums, target, start: start, end: middle - 1)
        } else if (nums[middle] < target) {
            return binarySearch(nums, target, start: middle+1, end: end)
        } else {
            return middle
        }
    }
}

var solution = Solution()
solution.search([4,5], 5)
//solution.binarySearch([1,2,3,4,5,6,7,8], 7, start: 0, end: 7)
