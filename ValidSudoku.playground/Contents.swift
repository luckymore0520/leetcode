//: Playground - noun: a place where people can play

import UIKit


//这里只需要验证数独是否符合要求而已，而不是给数独求解


class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        //那么这里只需要考虑三种情况，行，列，方阵
        var rowSet = Set<Character>()
        var columnSet = Set<Character>()
        var squareSet = Set<Character>()
        for i in 0...8 {
            for j in 0...8 {
                let rowValue = board[i][j];
                if (rowValue != "." ) {
                    if (!rowSet.insert(rowValue).inserted) {
                        return false
                    }
                    
                }
                
                let columnValue = board[j][i];
                if (columnValue != "." ) {
                    if (!columnSet.insert(columnValue).inserted){
                        return false
                    }
                    
                }
                
                let squareValue = board[3 * ( i / 3) + j / 3][3 * (i % 3) + j % 3]
                if (squareValue != ".") {

                    if (!squareSet.insert(squareValue).inserted) {
                        return false
                    }
                }
            }
            rowSet.removeAll()
            columnSet.removeAll()
            squareSet.removeAll()
        }
        return true
    }
}

var solution = Solution()

var board = ["..4...63.",".........","5......9.","...56....","4.3.....1","...7.....","...5.....",".........","........."]
var input:[[Character]] = []
for str in board {
    var characters:[Character] = []
    for char in str.characters {
        characters.append(char)
    }
    input.append(characters)
}

solution.isValidSudoku(input)

 