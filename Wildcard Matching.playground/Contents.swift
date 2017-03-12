//: Playground - noun: a place where people can play

import UIKit

//'?' Matches any single character.
//'*' Matches any sequence of characters (including the empty sequence).
//
//The matching should cover the entire input string (not partial).
//
//The function prototype should be:
//bool isMatch(const char *s, const char *p)
//
//Some examples:
//isMatch("aa","a") → false
//isMatch("aa","aa") → true
//isMatch("aaa","aa") → false
//isMatch("aa", "*") → true
//isMatch("aa", "a*") → true
//isMatch("ab", "?*") → true
//isMatch("aab", "c*a*b") → false


extension String {
    func characterArray() -> [Character] {
        return Array(self.characters)
    }
}

//solution.isMatch("babaaababaabababbbbbbaabaabbabababbaababbaaabbbaaab",
//                 "*bba*a*bbba*aab*b")
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sArray = s.characterArray()
        let pArray = preprocedure(p.characterArray())
        var sIndex = 0
        var pIndex = 0
        var starIndex = -1
        var match = 0
        while sIndex < sArray.count {
            
            if (pIndex < pArray.count && (pArray[pIndex] == "?" || pArray[pIndex] == sArray[sIndex])){
                sIndex += 1
                pIndex += 1
            } else if (pIndex < pArray.count && pArray[pIndex] == "*") {
                starIndex = pIndex
                match = sIndex
                pIndex += 1
            } else if (starIndex != -1) {
                pIndex = starIndex + 1
                match += 1
                sIndex = match
            } else {
                return false
            }
        }
        while pIndex < pArray.count && pArray[pIndex] == "*" {
            pIndex += 1
        }
        return pIndex == pArray.count
    }
    
    func preprocedure(_ p:[Character]) -> [Character]{
        var result:[Character] = []
        for char in p {
            if char != "*" {
                result.append(char)
            } else if result.last != "*"{
                result.append(char)
            }
        }
        return result
    }
//
//    func isMatch(_ sArray:[Character], _ pArray: [Character], sStart: Int, pStart:Int) -> Bool {
//        var i = sStart
//        if (pStart < pArray.count) {
//            for j in pStart...pArray.count-1 {
//                let char = pArray[j]
//                if char == "*" {
//                    if j == pArray.count - 1 {
//                        return true
//                    }
//                    var next = i
//                    while next <= sArray.count {
//                        if (isMatch(sArray, pArray, sStart: next, pStart: j+1)) {
//                            return true
//                        } else {
//                            next += 1
//                        }
//                    }
//                    return false
//                } else if i >= sArray.count {
//                    return false
//                } else if char == "?" {
//                    i += 1
//                } else if char != sArray[i] {
//                    return false
//                } else {
//                    i += 1
//                }
//            }
//
//        }
//        if i < sArray.count {
//            return false
//        }
//        return true
//    }
}


let p = "a*"
let solution = Solution()
solution.isMatch("babaaababaabababbbbbbaabaabbabababbaababbaaabbbaaab",
    "***bba**a*bbba**aab**b")