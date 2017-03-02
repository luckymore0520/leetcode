//: Playground - noun: a place where people can play

import UIKit

//Divide two integers without using multiplication, division and mod operator.
//
//If it is overflow, return MAX_INT.
//
//Subscribe to see which companies asked this question.


class Solution {
    static let MaxInt = 2147483647;
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if (divisor == 0) {
            return Solution.MaxInt
        }
        var result = 0;
        var isNegative = false
        let positiveDivisor = abs(divisor)
        var positiveDividend = abs(dividend)
        if ((divisor > 0 && dividend < 0) || (dividend > 0 && divisor < 0)) {
            isNegative = true
        }
        while (positiveDividend >= positiveDivisor) {
            var tmp = positiveDivisor
            var multiple = 1
            while (positiveDividend >= (tmp << 1)) {
                tmp = tmp << 1
                multiple = multiple << 1
            }
            positiveDividend -= tmp
            result += multiple
        }

        return min(isNegative ? -result : result, Solution.MaxInt)
    }
}


let solution = Solution()
solution.divide(215615615, 1)