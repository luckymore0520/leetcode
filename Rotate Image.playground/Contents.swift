//: Playground - noun: a place where people can play

import UIKit

//You are given an n x n 2D matrix representing an image.
//
//Rotate the image by 90 degrees (clockwise).
//
//Follow up:
//Could you do this in-place?

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        if (n <= 1) {
            return
        }
        for k in 0...n/2-1 {
            for i in k...n-2-k {
                (matrix[k][i],matrix[i][n-1-k],matrix[n-1-k][n-i-1],matrix[n-i-1][k]) = (matrix[n-i-1][k],matrix[k][i],matrix[i][n-1-k],matrix[n-1-k][n-i-1])
            }
        }
    }
}

//1  2  3  4
//5  6  7  8
//9  10 11 12
//13 14 15 16




let solution = Solution()
var matric = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
solution.rotate(&matric)
print(matric)