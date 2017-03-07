//: Playground - noun: a place where people can play

import UIKit

//You are given a string, s, and a list of words, words, that are all of the same length. Find all starting indices of substring(s) in s that is a concatenation of each word in words exactly once and without any intervening characters.
//
//For example, given:
//s: "barfoothefoobarman"
//words: ["foo", "bar"]
//
//You should return the indices: [0,9].
//(order does not matter).

extension String {
    func intIndex(_ index:Index?) -> Int? {
        guard let index = index else { return nil }
        return distance(from: startIndex, to: index)
    }
}


class Solution {
    
    
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        var ans:[Int] = []
        let length = s.characters.count
        let wordCount = words.count
        if (length < 1 && wordCount < 1) {
            return ans
        }
        let wordLength = words[0].characters.count
        if (length < wordCount * wordLength) {
            return ans
        }
        

        
        var map:[String:Int] = [:]
        for word in words {
            if let count = map[word] {
                map[word] = count + 1
            } else {
                map[word] = 1
            }
        }
        for i in 0...length - wordLength * wordCount {
            var from = i
            var copyedMap = map
            let startIndex = s.index(s.startIndex, offsetBy: from)
            let endIndex = s.index(s.startIndex, offsetBy: from + wordLength)
            var str = s[startIndex..<endIndex]
            var count = 0
            while copyedMap[str] != nil && copyedMap[str]! > 0 {
                let strCount = copyedMap[str]!
                copyedMap[str] = strCount - 1
                count += 1
                from += wordLength
                if (from + wordLength > length) {
                    break
                }
                let startIndex = s.index(s.startIndex, offsetBy: from)
                let endIndex = s.index(s.startIndex, offsetBy: from + wordLength)
                str = s[startIndex..<endIndex]
            }
            if (count == wordCount) {
                ans.append(i)
            }
        }
        return ans
    }
}

let solution = Solution()
solution.findSubstring("a",
    ["a","a"])
