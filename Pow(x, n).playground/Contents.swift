//: Playground - noun: a place where people can play

import UIKit

//Implement pow(x, n).
//



class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if (n == 0) {
            return 1
        }
        if (n == 1) {
            return x
        }
        if (n == 2) {
            return x * x
        }
        let isNegative = n < 0
        let positiveN = abs(n)
        var result:Double
        if (positiveN % 2) == 0 {
            result =  myPow(myPow(x, positiveN/2),2)
        } else {
            result =  x * myPow(x, positiveN-1)
        }
        return isNegative ? 1/result : result
    }
}

let solution = Solution()
solution.myPow(2, -2)