//: Playground - noun: a place where people can play

import UIKit

//Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
//
//If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).
//
//The replacement must be in-place, do not allocate extra memory.
//
//Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
//1,2,3 → 1,3,2
//3,2,1 → 1,2,3
//1,1,5 → 1,5,1


class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        if (nums.count < 2) {
            return
        }
        var index = 0
        for i in (1...nums.count-1).reversed() {
            if (nums[i] > nums[i-1]) {
                index = i
                break
            }
        }
        //如果本身就是最大的了，逆序
        if (index == 0) {
            nums.sort()
        } else {
            //需要找到比 index-1 位置上大的最小的数
            for i in (index...nums.count-1).reversed() {
                if (nums[i] > nums[index-1]) {
                    (nums[i],nums[index-1]) = (nums[index-1],nums[i])
                    break
                }
            }
            nums[index...nums.count-1].sort()
        }
    }
}

let solution = Solution()
var nums = [1,2,3]
solution.nextPermutation(&nums)
print(nums)