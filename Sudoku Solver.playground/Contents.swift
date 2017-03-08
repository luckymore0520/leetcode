//: Playground - noun: a place where people can play

import UIKit

//解数独，这里可以用回溯的方法，从第一个点开始




class Solution {
    
    
    
    func solveSudoku(_ board: inout [[Character]]) {
        solveSudoku(&board, position: 0)
    }
    
    func solveSudoku(_ board: inout [[Character]], position:Int) -> Bool {
        if (position >= 81) {
            return true
        }
        let row = position / 9
        let column = position % 9
        if (board[row][column] == ".") {
            for i in 1...9 {
                board[row][column] = "\(i)".characters.first!
                if (check(board, position: position)) {
                    if (solveSudoku(&board, position: position + 1)) {
                        return true
                    }
                }
                board[row][column] = "."
            }
        } else {
            return solveSudoku(&board, position: position + 1)
        }
        return false
    }
    
    func check(_ board: [[Character]], position:Int) -> Bool{
        //这里的check 其实只需要跟对应位置有关的三个是否有其他位置
        let row = position / 9
        let column = position % 9
        let value = board[row][column]
        
        //考虑第row行
        for i in 0...8 {
            if (i != column && board[row][i] == value) {
                return false
            }
         }
        
        for i in 0...8 {
            if (i != row && board[i][column] == value ) {
                return false
            }
        }
        
        let squareRow = row / 3
        let squareColumn = column / 3
        for i in 0...2 {
            for j in 0...2 {
                let comparedRow = squareRow * 3 + i
                let comparedColumn = squareColumn * 3 + j
                if (row != comparedRow && column != comparedColumn && board[comparedRow][comparedColumn] == value) {
                    return false
                }
            }
        }
        return true
        
    }
}


var solution = Solution()

var board = ["..9748...","7........",".2.1.9...","..7...24.",".64.1.59.",".98...3..","...8.3.2.","........6","...2759.."]
var input:[[Character]] = []
for str in board {
    var characters:[Character] = []
    for char in str.characters {
        characters.append(char)
    }
    input.append(characters)
}
solution.solveSudoku(&input)
print(input)
