//: Playground - noun: a place where people can play

import UIKit


class Solution {
    func totalNQueens(_ n: Int) -> Int {
        var num = 0
        var i = 0;
        var qArray = Array(repeating: -1, count: n)
        while qArray[0] < n {
            while i < n {
                var j = qArray[i] + 1
                if (qArray[i] >= 0) {
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
                num += 1
                i -= 1
            } else {
                break
            }
        }
        return num
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
print(solution.totalNQueens(4))
