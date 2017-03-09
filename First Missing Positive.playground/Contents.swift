//: Playground - noun: a place where people can play

import UIKit



//Given an unsorted integer array, find the first missing positive integer.
//
//For example,
//Given [1,2,0] return 3,
//and [3,4,-1,1] return 2.
//
//Your algorithm should run in O(n) time and uses constant space.


//这题要求 O(n)，而且对空间有要求
//遍历数组，把对应数字交换到对应的位置

class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        if (nums.isEmpty) {
            return 1
        }
        var nums = nums
        var i = 0
        while i < nums.count {
            if (nums[i] != i+1 && nums[i] <= nums.count && nums[i] > 0 && nums[i] != nums[nums[i]-1]) {
                (nums[i],nums[nums[i]-1]) = (nums[nums[i]-1], nums[i])
            } else {
                i += 1
            }
        }
        for i in 0...nums.count-1 {
            if nums[i] != i+1 {
                return i+1
            }
        }
        return nums.count + 1
        
    }
}

let solution = Solution()
solution.firstMissingPositive([3,4,-1,1])