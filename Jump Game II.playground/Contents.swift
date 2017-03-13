//: Playground - noun: a place where people can play

import UIKit

//Given an array of non-negative integers, you are initially positioned at the first index of the array.
//
//Each element in the array represents your maximum jump length at that position.
//
//Your goal is to reach the last index in the minimum number of jumps.
//
//For example:
//Given array A = [2,3,1,1,4]
//
//The minimum number of jumps to reach the last index is 2. (Jump 1 step from index 0 to 1, then 3 steps to the last index.)
//
//Note:
//You can assume that you can always reach the last index.
//
//Subscribe to see which companies asked this question.


class Solution {
    func jump(_ nums: [Int]) -> Int {
        
        if nums.count < 2 {
            return 0
        }
        
        var level = 0
        var currentMax = 0
        var nextMax = 0
        var i = 0;
        
        while currentMax - i + 1 > 0 {
            level += 1
            while i <= currentMax {
                nextMax = max(nextMax, nums[i] + i)
                if (nextMax >= nums.count-1) {
                    return level
                }
                i += 1
            }
            currentMax = nextMax
        }
        return 0
    }
    
//    func jump(_ nums: [Int], from:Int) -> Int {
//        if (from >= nums.count - 1) {
//            return 0
//        }
//        let step = nums[from]
//        if (step == 0) {
//            return Int.max
//        } else if (step + from >= nums.count - 1) {
//            return 1
//        } else {
//            var length = Int.max
//            for i in (1...step).reversed() {
//                length = min(length, jump(nums, from: from + i))
//                if (length <= 1) {
//                    break
//                }
//            }
//            return length == Int.max ? Int.max : length + 1
//        }
//    }
}

let solution = Solution()
solution.jump([5,9,3,2,1,0,2,3,3,1,0,0])