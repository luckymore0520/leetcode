//: Playground - noun: a place where people can play

import UIKit
//
//Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
//
//For example,
//Given the following matrix:
//
//[
//[ 1, 2, 3 ],
//[ 4, 5, 6 ],
//[ 7, 8, 9 ]
//]
//You should return [1,2,3,6,9,8,7,4,5].


class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result:[Int] = []
        let row = matrix.count
        if (row == 0) {
            return result
        }
        let column = matrix[0].count
        
        
        
        for i in 0...(min(row,column) + 1) / 2 - 1  {
            if (column - i - 1 >= i) {
                for j in i...column - i - 1 {
                    result.append(matrix[i][j])
                }
            }
//            print(result)
            if (row - i - 1 >= i+1) {
                for j in i+1...row - i - 1 {
                    result.append(matrix[j][column-i-1])
                }
            }
            
//            print(result)

            if (row - i - 1 > i && column - i - 2 >= i) {
                for j in (i...column - i - 2).reversed() {
                    result.append(matrix[row-i-1][j])
                }
            }
//            print(result)

            
            if (column-i-1 > i && row - i - 2 >= i+1) {
                for j in (i+1...row - i - 2).reversed() {
                    result.append(matrix[j][i])
                }
            }
//            print(result)

        }
        return result
    }
}

let solution = Solution()
solution.spiralOrder([[1,2,3],[4,5,6],[7,8,9]])