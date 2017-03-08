//: Playground - noun: a place where people can play

import UIKit
//
//The count-and-say sequence is the sequence of integers beginning as follows:
//1, 11, 21, 1211, 111221, ...
//
//1 is read off as "one 1" or 11.
//11 is read off as "two 1s" or 21.
//21 is read off as "one 2, then one 1" or 1211.
//Given an integer n, generate the nth sequence.
//
//Note: The sequence of integers will be represented as a string.
//
//Subscribe to see which companies asked this question.


class Solution {
    func countAndSay(_ n: Int) -> String {
        if (n == 1) {
            return "1"
        }
        let characters = Array(countAndSay(n-1).characters)
        var result = ""
        var i = 0
        while i < characters.count {
            let char = characters[i]
            var count = 1
            while (i+1 < characters.count && characters[i+1] == char) {
                i += 1
                count += 1
            }
            result.append("\(count)\(char)")
            i += 1
        }
        return result
    }
}

let solution = Solution()
solution.countAndSay(6)