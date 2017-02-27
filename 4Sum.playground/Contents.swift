//: Playground - noun: a place where people can play

import UIKit

//Given an array S of n integers, are there elements a, b, c, and d in S such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.
//
//Note: The solution set must not contain duplicate quadruplets.
//
//For example, given array S = [1, 0, -1, 0, -2, 2], and target = 0.
//
//A solution set is:
//[
//[-1,  0, 0, 1],
//[-2, -1, 1, 2],
//[-2,  0, 0, 2]
//]



class Solution {
 
    
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        
        
        func threeSum(_ nums: [Int], _ start:Int, _ target: Int) -> [[Int]] {
            
            
            
            func twoSum(_ nums: [Int], _ from:Int, _ target: Int) -> [[Int]] {
                var result:[[Int]] = []
                var start = from;
                var end = nums.count-1
                while start < end {
                    let tmpResult = nums[start]+nums[end]
                    if (tmpResult == target) {
                        result.append([nums[start],nums[end]])
                        start += 1
                        end -= 1
                    } else if (tmpResult < target) {
                        start += 1
                    } else {
                        end -= 1
                    }
                    while start > from, start < end, nums[start] == nums[start-1]  {
                        start += 1
                    }
                    while end < nums.count-1, nums[end] == nums[end+1] {
                        end -= 1
                    }
                }
                return result
            }
        
            if nums.count - start < 3 {
                return []
            }

            var result:[[Int]] = []
            for i in start...nums.count-3 {
                if ( i > start && nums[i] == nums[i-1]) {
                    continue
                }
                
                let target = target - nums[i]
                let twoSumResults = twoSum(nums, i+1, target)
                for twoSumResult in twoSumResults {
                    var mutableTwoSumResult = twoSumResult;
                     mutableTwoSumResult.insert(nums[i], at: 0)
                    result.append(mutableTwoSumResult)
                }
            }
            return result
        }
        
        
        if nums.count < 4 {
            return []
        }
        
        if nums.count == 4 {
            let result = nums.reduce(0, {$0+$1})
            if result == target {
                return [nums];
            }
            return []
        }
        let sorted = nums.sorted();
        var result:[[Int]] = []
        for i in 0...sorted.count-4 {
            if ( i > 0 && sorted[i] == sorted[i-1]) {
                 continue
            }
            let target = target - sorted[i]
            let threeSumResult = threeSum(sorted, i+1, target)
            for threeSumResult in threeSumResult {
                var mutableThreeSumResult = threeSumResult;
                mutableThreeSumResult.insert(sorted[i], at: 0)
                result.append(mutableThreeSumResult)
            }
        }
        return result;
    }
}

let solution = Solution();
solution.fourSum([-3,-2,-1,0,0,1,2,3], 0)