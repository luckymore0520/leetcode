//: Playground - noun: a place where people can play

import UIKit

//Given a collection of distinct numbers, return all possible permutations.
//
//For example,
//[1,2,3] have the following permutations:
//[
//[1,2,3],
//[1,3,2],
//[2,1,3],
//[2,3,1],
//[3,1,2],
//[3,2,1]
//]


class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        if (nums.isEmpty) {
            return []
        }
        if (nums.count == 1) {
            return [nums]
        }
        var result:[[Int]] = []
        var nums = nums
        for i in 0...nums.count-1 {
            let num = nums[i]
            nums.remove(at: i)
            var remained = permute(nums)
            remained = remained.map({ (remain) -> [Int] in
                var remain = remain
                remain.insert(num, at: 0)
                return remain
            })
            result += remained
            nums.insert(num, at: i)
        }
        return result
    }
}

let solution = Solution()

print(solution.permute([1,2,3]))