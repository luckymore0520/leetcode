//: Playground - noun: a place where people can play

import UIKit

//Given a collection of numbers that might contain duplicates, return all possible unique permutations.
//
//For example,
//[1,1,2] have the following unique permutations:
//[
//[1,1,2],
//[1,2,1],
//[2,1,1]
//]
//

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        if (nums.isEmpty) {
            return []
        }
        if (nums.count == 1) {
            return [nums]
        }
        var result:[[Int]] = []
        var nums = nums.sorted()
        for i in 0...nums.count-1 {
            let num = nums[i]
            if (i > 0 && nums[i-1] == num) {
                continue
            }
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

print(solution.permute([1,2,1]))