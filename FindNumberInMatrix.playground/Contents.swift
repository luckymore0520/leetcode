//: Playground - noun: a place where people can play

import UIKit

let matrix = [[1,2,8,9],[2,4,9,12],[4,7,10,13],[6,8,11,15]];



func findNumInMatrix(matrix:[[Int]], rows: Int, colums: Int, number: Int) -> (Int,Int)?{
    //行数列数不能为0
    if (rows * colums == 0) {
        return nil
    }
    //取右上角
    var targetColum = colums - 1;
    var targetRow = 0;
    while (targetColum >= 0 && targetRow < rows) {
        let comparedValue = matrix[targetRow][targetColum];
        if (comparedValue == number) {
            return (targetRow,targetColum)
        }
        //右上角的比目标值大，取左侧矩形
        else if (comparedValue > number) {
            targetColum -= 1;
        } else {
            //右上角的值比目标值小，说明该行前面的都小了，直接从第二行看起
            targetRow += 1;
            //在该列遍历
            for i in targetRow+1...rows-1 {
                let value = matrix[i][targetColum];
                if (value == comparedValue) {
                    return (i,targetColum);
                } else if (value > comparedValue) {
                    break;
                }
            }
        }
    }
    return nil
}

findNumInMatrix(matrix: matrix, rows: 4, colums: 4, number: 4)