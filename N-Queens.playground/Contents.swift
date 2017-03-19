//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.
//
//
//
//Given an integer n, return all distinct solutions to the n-queens puzzle.
//
//Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space respectively.
//
//For example,
//There exist two distinct solutions to the 4-queens puzzle:
//
//[
//[".Q..",  // Solution 1
//"...Q",
//"Q...",
//"..Q."],
//
//["..Q.",  // Solution 2
//"Q...",
//"...Q",
//".Q.."]
//]

class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var result:[[String]] = []
        
        
        let row:[Character] = Array(repeating: ".", count: n)
        var matric:[[Character]] = Array(repeating: row, count: n)
        
        var i = 0;
        var qArray = Array(repeating: -1, count: n)
        while qArray[0] < n {
            while i < n {
                var j = qArray[i] + 1
                if (qArray[i] >= 0) {
                    matric[i][qArray[i]] = "."
                    qArray[i] = -1
                }
                //判断这里如果j超过了最后一个了
                if (j >= n && i == 0) {
                    break
                }
                while j < n {
                    qArray[i] = j
                    if checkNQueens(qArray: qArray, targetRow: i) == false {
                        j += 1
                        qArray[i] = -1
                    } else {
                        matric[i][j] = "Q"
                        break
                    }
                }
                //如果遍历到最后一个依然找不到，需要回溯
                if (j == n) {
                    i -= 1
                } else {
                    i += 1
                }
            }
            if (i == n) {
                result.append(matric.map({ (character) -> String in
                    String(character)
                }))
                i -= 1
            } else {
                break
            }
        }
        return result
    }
    
    
    
    func checkNQueens(qArray:[Int], targetRow:Int) -> Bool {
        let count = qArray.count
        //检查一列
        for i in 0...count-1 {
            if qArray[i] != -1 &&  i != targetRow && qArray[i] == qArray[targetRow] {
                return false
            }
        }
        
        //检查 \ 方向 差相同
        for i in 0...count - 1 {
            let minus = i - qArray[i]
            if (qArray[i] != -1 && i != targetRow && minus == targetRow - qArray[targetRow]) {
                return false
            }
        }
        
        // 检查 / 方向 和相同
        for i in 0...count - 1 {
            let sum = i + qArray[i]
            if (qArray[i] != -1 && i != targetRow && sum == targetRow + qArray[targetRow]) {
                return false
            }
        }
        return true
    }
}

let solution = Solution()
print(solution.solveNQueens(4))
