//: Playground - noun: a place where people can play

import UIKit

//Given an array of strings, group anagrams together.
//
//For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"],
//Return:
//
//[
//["ate", "eat","tea"],
//["nat","tan"],
//["bat"]
//]

extension String {
    func toArray()->[Character] {
        return Array(self.characters)
    }
    
    func sortedString()->String {
        return String(self.characters.sorted())
    }
}

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dic:[String:[String]] = [:]
        for str in strs {
            let sorted = str.sortedString()
            if (dic[sorted] != nil) {
                dic[sorted]?.append(str)
            } else {
                dic[sorted] = [str]
            }
        }
        var result:[[String]] = []
        for (_,value) in dic {
          result.append(value)
        }
        return result
    }
}

let solution = Solution()
print(solution.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))