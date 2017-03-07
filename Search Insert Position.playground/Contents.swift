//: Playground - noun: a place where people can play

import UIKit

//Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
//
//You may assume no duplicates in the array.
//
//Here are few examples.
//[1,3,5,6], 5 → 2
//[1,3,5,6], 2 → 1
//[1,3,5,6], 7 → 4
//[1,3,5,6], 0 → 0




//同样也是二分查找，但是需要保存最后一个查找的位置
class Solution {
    var lastVisitIndex = -1
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        let index =  binarySearch(nums, target, start: 0, end: nums.count - 1)
        if (index == -1) {
            let placeShouldInsert = lastVisitIndex;
            lastVisitIndex = -1
            return placeShouldInsert
        }
        return index
    }
    
    func binarySearch(_ nums:[Int], _ target:Int, start:Int, end:Int) -> Int {
        if (start > end) {
            lastVisitIndex = start
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
solution.searchInsert([1,3,5,6], 0)
