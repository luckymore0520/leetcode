//: Playground - noun: a place where people can play

import UIKit


//Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
//
//For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
//the contiguous subarray [4,-1,2,1] has the largest sum = 6.
//
//click to show more practice.
//
//Subscribe to see which companies asked this question.
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var sum = nums[0]
        var result = sum
        if (nums.count > 1) {
            for i in 1...nums.count - 1 {
                if sum > 0 {
                    sum += nums[i]
                } else {
                    sum = nums[i]
                }
                result = max(result, sum)
            }
        }
        return result
    }
}

let solution = Solution()
solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])