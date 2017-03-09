//: Playground - noun: a place where people can play

import UIKit

//Given a set of candidate numbers (C) (without duplicates) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.
//
//The same repeated number may be chosen from C unlimited number of times.
//
//Note:
//All numbers (including target) will be positive integers.
//The solution set must not contain duplicate combinations.
//For example, given candidate set [2, 3, 6, 7] and target 7,
//A solution set is:
//[
//[7],
//[2, 2, 3]
//]


class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let sorted = candidates.sorted()
        return combinationSumInsortedArray(sorted, target, 0) ?? []
    }
    
    func combinationSumInsortedArray(_ candidates: [Int], _ target: Int, _ start:Int) -> [[Int]]? {
        if target == 0 {
            return []
        } else {
            var result:[[Int]] = []
            for i in start...candidates.count-1 {
                let num = candidates[i]
                if (num <= target) {
                    //返回是nil 代表不存在，直接考虑下一个
                    if let remains = combinationSumInsortedArray(candidates, target - num, i) {
                        if remains.isEmpty {
                            result.append([num])
                        } else {
                            for remain in remains {
                                var complete = remain
                                complete.insert(num, at: 0)
                                result.append(complete)
                            }
                        }
                    }
                } else {
                    break
                }
            }
            return result.isEmpty ? nil : result
        }
    }
}

let solution = Solution()
let result = solution.combinationSum([2,3,6,7], 7)
print(result)