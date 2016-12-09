//: Playground - noun: a place where people can play

import UIKit

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var array = Array<Character>()
        var maxLength = 0
        for c in s.characters {
            if let i = array.index(of: c) {
                array.removeFirst(i+1)
            }
            array.append(c)
            if array.count > maxLength {
                maxLength = array.count;
            }
        }
        return maxLength
    } 
}


