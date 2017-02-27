//: Playground - noun: a place where people can play

import UIKit

class Stack<T>{
    var stack: [T]
    init(){
        stack = [T]()
    }
    func push(element:T){
        stack.append(element)
    }
    func pop() -> T?{
        if (stack.isEmpty) {
            return nil;
        }
        return stack.removeLast()
    }
    func isEmpty() -> Bool {
        return stack.isEmpty;
    }
    func peek() -> T? {
        return stack.last
    }
    func size() -> Int {
        return stack.count;
    }
}

class Solution {
    let left = ["(".characters.first!,"[".characters.first!,"{".characters.first!]
    let right = [")".characters.first!,"]".characters.first!,"}".characters.first!]
    func isValid(_ s: String) -> Bool {
        let stack = Stack<Character>()
        for character in s.characters {
            if left.contains(character) {
                stack.push(element: character)
            } else if let rightIndex = right.index(of: character) {
                let leftPair = left[rightIndex]
                let top = stack.pop();
                if (leftPair != top) {
                    return false
                }
            } else {
                return false
            }
            
        }
        return stack.isEmpty()
    }
}

let solution = Solution()
solution.isValid("[]()([])")