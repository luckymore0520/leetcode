//: Playground - noun: a place where people can play

import UIKit

//Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.
//
//For example,
//Given [0,1,0,2,1,0,1,3,2,1,2,1], return 6.


class Solution {
    func trap(_ height: [Int]) -> Int {
        if (height.count <= 2) {
            return 0
        }
        var water = 0
        for i in 0...height.count - 2 {
            let current = height[i]
            let right = height[i+1]
            //右边更低且右边至少有两个才可能存水
            if (right < current && i+1 < height.count-1) {
                var highest = right
                for j in i+2...height.count-1 {
                    let next = height[j]
                    if (next > highest) {
                        water += (min(next,current) - highest) * (j - i - 1)
                        highest = next
                    }
                    if (highest > current) {
                        break
                    }
                }
            }
        }
        return water
    }
}


let solution = Solution()
solution.trap([])