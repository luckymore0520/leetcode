//: Playground - noun: a place where people can play

import UIKit
//
//Given a collection of candidate numbers (C) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.
//
//Each number in C may only be used once in the combination.
//
//Note:
//All numbers (including target) will be positive integers.
//The solution set must not contain duplicate combinations.
//For example, given candidate set [10, 1, 2, 7, 6, 1, 5] and target 8,
//A solution set is:
//[
//[1, 7],
//[1, 2, 5],
//[2, 6],
//[1, 1, 6]
//]


class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let sorted = candidates.sorted()
        return combinationSumInsortedArray(sorted, target, 0) ?? []
    }
    
    func combinationSumInsortedArray(_ candidates: [Int], _ target: Int, _ start:Int) -> [[Int]]? {
        if target == 0 {
            return []
        } else if start > candidates.count - 1 {
            return nil
        } else {
            var result:[[Int]] = []
            for i in start...candidates.count-1 {
                let num = candidates[i]
                
                //如果这个数字和前一个数组一样，直接跳过
                if (i > start && candidates[i-1] == num) {
                    continue
                }
                if (num <= target) {
                    //返回是nil 代表不存在，直接考虑下一个
                    if let remains = combinationSumInsortedArray(candidates, target - num, i + 1) {
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
let result = solution.combinationSum2([1], 1)
print(result)