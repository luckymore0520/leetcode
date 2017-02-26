//: Playground - noun: a place where people can play

import UIKit
//
//Given an array S of n integers, find three integers in S such that the sum is closest to a given number, target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
//
//For example, given array S = {-1 2 1 -4}, and target = 1.
//
//The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).


// 给一个数组，和一个目标和，给出数组中的三个数的和最接近于目标和的结果

class Solution {

    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var difference:Int = Int.max
        var result:Int = 0
        
        
        func findSum(target:Int, current:Int, start:Int, end:Int, nums:[Int]) -> Int? {
            var start = start;
            var end = end;
            while start < end {
                let tmpResult = current + nums[start] + nums[end];
                if (tmpResult == target) {
                    return target
                } else if (tmpResult > target) {
                    //结果比目标大，右移end
                    end -= 1
                } else {
                    start += 1
                }
                let tmpDifference = abs(tmpResult - target);
                if (tmpDifference < difference) {
                    difference = tmpDifference;
                    result = tmpResult;
                }
            }
            return nil;
        }
        //排序
        if (nums.count <= 3) {
            return nums.reduce(0, {$0+$1})
        }
        let sorted = nums.sorted();
        for i in 0...sorted.count-3 {
            if let result = findSum(target: target,current: sorted[i], start: i+1, end: sorted.count-1, nums: sorted) {
                return result;
            }
        }
        return result;
        


    }
    
    
    }

let solution = Solution();
solution.threeSumClosest([-1,2,1,-4], 1);