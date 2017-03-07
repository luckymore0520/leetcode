//: Playground - noun: a place where people can play

import UIKit

//Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.
//
//For "(()", the longest valid parentheses substring is "()", which has length = 2.
//
//Another example is ")()())", where the longest valid parentheses substring is "()()", which has length = 4.
//
//Subscribe to see which companies asked this question.



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
    func longestValidParentheses(_ s: String) -> Int {
        if (s.isEmpty) {
            return 0
        }
        var array:[Character] = []
        for character in s.characters {
            array.append(character)
        }
        let stack = Stack<Int>()
        var count:Int = 0
        
        for i in 0...array.count-1 {
            let character = array[i]
            if character == "(" {
                stack.push(element: i)
            } else if !stack.isEmpty() {
                let index = stack.peek()!
                if (array[index] == "(") {
                    stack.pop()
                } else {
                    stack.push(element: i)
                }
            } else {
                stack.push(element: i)
            }
        }
        if (stack.isEmpty()) {
            count = array.count
        } else {
            var length = array.count
            while !stack.isEmpty() {
                let top = stack.pop()!
                count = max(count, length - top - 1)
                length = top
            }
            count = max(length,count)
        }
        return count
    }
}

let solution = Solution()
solution.longestValidParentheses("")