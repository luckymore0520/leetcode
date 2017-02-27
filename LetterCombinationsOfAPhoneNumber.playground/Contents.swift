//: Playground - noun: a place where people can play

import UIKit

//Given a digit string, return all possible letter combinations that the number could represent.
//
//A mapping of digit to letters (just like on the telephone buttons) is given below.

//Input:Digit string "23"
//Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].



class Solution {
    let dictionary = ["1":[],"2":["a","b","c"],"3":["d","e","f"],"4":["g","h","i"],"5":["j","k","l"],"6":["m","n","o"],"7":["p","q","r","s"],"8":["t","u","v"],"9":["w","x","y","z"]];
    
    
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty {
            return [];
        }
        if digits.characters.count == 1 {
            let key:String = String(digits.characters.first!);
            return dictionary[key]!;
        } else {
            let key:String = String(digits.characters.first!);
            let prefixs = dictionary[key]!;
            var result:[String] = [];
            let suffixs = letterCombinations(digits.substring(from: digits.index(after: digits.startIndex)));
            for prefix in prefixs {
                for sufix in suffixs {
                    result.append(prefix+sufix)
                }
            }
            return result
        }
    }
}

let solution = Solution();
solution.letterCombinations("234")