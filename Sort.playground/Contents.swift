//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//归并排序
func mergeSort<T:Comparable>(_ array:[T]) -> [T] {
    func merge(_ left:[T], _ right:[T]) -> [T]{
        var result = [T]();
        var leftIndex = 0;
        var rightIndex = 0;
        while (leftIndex < left.count && rightIndex < right.count) {
            let leftElement = left[leftIndex];
            let rightElement = right[rightIndex];
            if (leftElement < rightElement) {
                result.append(leftElement)
                leftIndex += 1;
            } else {
                result.append(rightElement)
                rightIndex += 1;
            }
        }
        while (leftIndex < left.count) {
            result.append(left[leftIndex]);
            leftIndex += 1;
        }
        while (rightIndex < right.count) {
            result.append(right[rightIndex]);
            rightIndex += 1;
        }
        return result;
    }
    if (array.count <= 1) {
        return array;
    }
    let length = array.count;
    let left = mergeSort(Array(array[0...length/2-1]));
    let right = mergeSort(Array(array[length/2...length-1]));
    return merge(left, right)
}


func quickSort(_ array:inout [Int]){
    func partition(_ array:inout [Int], start:Int, end:Int) -> Int{
        //候选取最后一个
        let candidate = array[end-1];
        var i = start;
        var j = end-2;
        while true {
            while (i < end-1 && array[i] < candidate) {
                i += 1;
            }
            while ( j >= 0 && array[j] >= candidate) {
                j -= 1;
            }
            //交换i和j的位置
            if (i<j) {
                (array[i],array[j]) = (array[j],array[i])
            } else{
                break;
            }
        }
        (array[i],array[end-1]) = (array[end-1],array[i])
        return i;
    }
    func quickSort(_ array:inout [Int], start:Int, end:Int) {
        if (start >= end) {
            return;
        }
        let priviot = partition(&array, start: start, end: end)
        quickSort(&array, start: start, end: priviot)
        quickSort(&array, start: priviot+1, end: end)
    }
    quickSort(&array, start: 0, end: array.count)
}


extension Int {
    var leftChild:Int{
        return self * 2 + 1
    }
    var rightChild:Int{
        return self * 2 + 2
    }
    var father:Int {
        return (self - 1 ) / 2
    }
}


func swap(_ array:inout [Int], _ p:Int, _ q:Int) {
    (array[p],array[q]) = (array[q],array[p]);
}

func shiftUp(_ array:inout [Int], targetNode:Int) {
    var targetNode = targetNode;
    while targetNode.father >= 0 {
        let father = array[targetNode.father];
        //如果父节点比目标节点小，交换
        if (father < array[targetNode]) {
            swap(&array, father, targetNode)
            targetNode = targetNode.father;
        } else {
            break;
        }
    }
}

func shiftDown(_ array:inout [Int], targetNode:Int, end:Int) {
    var targetNode = targetNode;
    while targetNode.leftChild < end {
        //取更大的
        var comparedChild = targetNode.leftChild;
        if (targetNode.rightChild < end && array[targetNode.rightChild] > array[comparedChild]) {
            comparedChild = targetNode.rightChild
        }
        if (array[comparedChild] > array[targetNode]) {
            swap(&array, comparedChild, targetNode);
            targetNode = comparedChild;
        } else {
            break;
        }
    }
}

func heapSort(_ array:inout [Int]) {
    for i in (0...(array.count-1).father).reversed() {
        shiftDown(&array, targetNode: i, end:array.count)
    }
    for i in (0...(array.count-1)).reversed() {
        swap(&array, 0, i);
        shiftDown(&array, targetNode: 0, end: i)
    }
}



var array = [1,3,2,5,7,6,0,8,4];
heapSort(&array)
//mergeSort(array)
//quickSort(&array)
