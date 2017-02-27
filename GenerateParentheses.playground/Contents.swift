//: Playground - noun: a place where people can play

import UIKit

//Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
//
//For example, given n = 3, a solution set is:
//
//[
//    "((()))",
//    "(()())",
//    "(())()",
//    "()(())",
//    "()()()"
//]


class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        return self.generateParenthesisWithTotal(n * 2)
    }
    func generateParenthesisWithTotal(_ n: Int) -> [String] {
        if (n < 2) {
            return [""]
        }
        if (n == 2) {
            return ["()"]
        }
        var result:[String] = []
        for i in stride(from: 1, to: n, by: 2) {
            let leftPart = generateParenthesisWithTotal(i-1)
            let rightPart = generateParenthesisWithTotal(n-i-1)
            var left:[String] = []
            for str in leftPart {
                left.append("("+str+")")
            }
            for leftStr in left {
                for rightStr in rightPart {
                    result.append(leftStr + rightStr)
                }
            }
        }
        return result
    }
}

let solution = Solution()
print(solution.generateParenthesis(3))
