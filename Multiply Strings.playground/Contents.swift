//: Playground - noun: a place where people can play

import UIKit

//Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2.
//
//Note:
//
//The length of both num1 and num2 is < 110.
//Both num1 and num2 contains only digits 0-9.
//Both num1 and num2 does not contain any leading zero.

extension Character {
    var asciiValue: UInt32? {
        return String(self).unicodeScalars.filter{$0.isASCII}.first?.value
    }
}

class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        if (num1 == "0" || num2 == "0") {
            return "0"
        }
        let num1 = getNumArray(num1)
        let num2 = getNumArray(num2)
        let short = num1.count > num2.count ? num2: num1
        let long = short == num1 ? num2 : num1
        var result:[Int] = []
        var zeros:[Int] = []
        for num in short.reversed() {
            var tmp = multiply(long, multiper: num)
            tmp += zeros
            print(tmp)
            result = add(result, tmp)
            zeros.append(0)
        }
        let resultString = result.reduce("") { (str, next) -> String in
            "\(str)\(next)"
        }
        return resultString
    }
    
    func add(_ num1:[Int],_ num2:[Int]) -> [Int] {
        var i = 0
        var add = 0
        var result:[Int] = []
        let num1Count = num1.count
        let num2Count = num2.count
        while i < num1Count && i < num2Count {
            let eachResult = num1[num1Count - i - 1] + num2[num2Count - i - 1] + add
            add = eachResult / 10
            result.insert(eachResult % 10, at: 0)
            i += 1
        }
        
        while i < num1Count {
            let eachResult = num1[num1Count - i - 1] + add
            add = eachResult / 10
            result.insert(eachResult % 10, at: 0)
            i += 1
        }
        
        while i < num2Count {
            let eachResult = num2[num2Count - i - 1] + add
            add = eachResult / 10
            result.insert(eachResult % 10, at: 0)
            i += 1
        }
        
        if (add > 0) {
            result.insert(add, at: 0)
        }
        return result
    }
    
    
    func multiply(_ num:[Int], multiper:Int) -> [Int] {
        var result:[Int] = []
        var add = 0
        for eachNum in num.reversed() {
            let eachResult = eachNum * multiper + add
            result.insert(eachResult % 10, at: 0)
            add = eachResult / 10
        }
        if (add > 0) {
            result.insert(add, at: 0)
        }
        return result
    }
    
    func getNumArray(_ num:String) -> [Int] {
        var array:[Int] = []
        for char in num.characters {
            let ascii = Int(char.asciiValue!)
            array.append(ascii - 48)
        }
        return array
    }
}

let solution = Solution()
solution.multiply("0", "456")


