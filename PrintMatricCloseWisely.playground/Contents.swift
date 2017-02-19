//: Playground - noun: a place where people can play

import UIKit

func printMatricCloseWisely(matric:[[Int]]){
    guard let (row,column) = getRowAndColumnInMatric(matric: matric) else {
        return;
    }
    var start = 0;
    while (row > start * 2 && column > start * 2) {
        printMatricInCircle(matric: matric, start: start);
        start += 1;
    }
    
}

func printMatricInCircle(matric:[[Int]],start:Int) {
    guard let (row,column) = getRowAndColumnInMatric(matric: matric) else {
        return;
    }
    let rowEnd = row - 1 - start;
    let columnEnd = column - 1 - start;
    
    //打印横着的
    for i in start...columnEnd {
        print(matric[start][i],terminator: " ")
    }
    //超过一行才可能打印接下来的
    if (rowEnd - start > 0) {
        //打印竖着的
        for i in start+1...rowEnd {
            print(matric[i][columnEnd],terminator: " ")
        }
        //打印最后一行，超过两列才可能打印接下来的
        if (columnEnd - start > 0) {
            for i in (start...columnEnd-1).reversed(){
                print(matric[rowEnd][i],terminator: " ")
            }
        }
        if (rowEnd - start > 1) {
            for i in (start+1...rowEnd-1).reversed() {
                print(matric[i][start],terminator: " ")
            }
        }
    }
    
    
}

func getRowAndColumnInMatric(matric:[[Int]]) -> (row:Int,column:Int)?{
    let row = matric.count;
    if (row == 0) {
        return nil;
    }
    let column = matric[0].count;
    if (column == 0) {
        return nil;
    }
    return (row,column);
}

let matric = [[1,2],[5,6],[9,10],[13,14]];
printMatricCloseWisely(matric: matric)