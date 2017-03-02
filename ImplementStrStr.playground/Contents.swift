//: Playground - noun: a place where people can play

import UIKit

//Implement strStr().
//
//Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.


class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let needleLength = needle.characters.count
        let haystackLength = haystack.characters.count
        if (haystackLength < needleLength ) {
            return -1
        }
        if (haystackLength == 0 || needleLength == 0) {
            return 0
        }

        for i in 0...haystackLength-needleLength {
            print(i)
            let startIndex = haystack.index(haystack.startIndex, offsetBy: i);
            let endIndex = haystack.index(haystack.startIndex, offsetBy: i + needleLength - 1)
            let subString = haystack[startIndex...endIndex]
            if (subString == needle) {
                return i
            }
        }
        return -1
    }
}

let solution = Solution()
solution.strStr("", "")