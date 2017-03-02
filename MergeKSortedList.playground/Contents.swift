//: Playground - noun: a place where people can play

import UIKit

//Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.


//这里可以建立一个大小为k的堆



extension ListNode: CustomStringConvertible {
    public var description: String {
        var desc = "\(val)"
        var next = self.next
        while next != nil {
            desc += "->\(next!.val)"
            next = next!.next
        }
        return desc
    }
}


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode : Comparable {
    public static func <(lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val < rhs.val
    }
    public static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val;
    }
}





extension Int {
    var leftChild:Int {
        return self * 2 + 1
    }
    
    var rightChild:Int {
        return self * 2 + 2
    }
    
    var parent:Int {
        return (self - 1) / 2
    }
}

func swap<T:Comparable>(_ array:inout [T],_ p:Int, _ q:Int) {
    (array[p],array[q]) = (array[q],array[p])
}


func shiftUp<T:Comparable>(_ target:Int, array:inout [T]) {
    var target = target
    while target.parent >= 0 {
        if (array[target.parent] > array[target]) {
            swap(&array, target, target.parent)
            target = target.parent
        } else {
            break
        }
    }
}

func shiftDown<T:Comparable>(_ target:Int, array:inout [T], end:Int) {
    var target = target;
    while (target.leftChild < end) {
        let leftChild = target.leftChild;
        let rightChild = target.rightChild;
        var smaller = leftChild;
        if (rightChild < array.count && array[rightChild] < array[leftChild]) {
            smaller = rightChild;
        }
        if (array[target] > array[smaller]) {
            swap(&array, target, smaller)
            target = smaller
        } else {
            break
        }
    }
}

func buildHeap<T:Comparable>(_ array:inout [T]) {
    if (array.count > 1) {
        for i in (0...(array.count-1).parent).reversed() {
            shiftDown(i, array: &array, end: array.count)
        }
    }
}



func addNumberToHeap<T:Comparable>(_ array:inout [T], _ number:T) {
    array.append(number)
    shiftUp(array.count-1, array: &array)
}


class Solution {
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {

        func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            let result:ListNode = ListNode(0)
            var head = result;
            var l1 = l1;
            var l2 = l2;
            while l1 != nil && l2 != nil {
                if (l1!.val < l2!.val) {
                    head.next = l1
                    l1 = l1?.next
                } else {
                    head.next = l2
                    l2 = l2?.next
                }
                head = head.next!
            }
            if (l1 != nil) {
                head.next = l1
            } else if (l2 != nil) {
                head.next = l2
            }
            return result.next
        }
        if (lists.isEmpty) {
            return nil
            
        }
        var lists = lists
        while lists.count > 1 {
            let first = lists.removeFirst()
            let second = lists.removeFirst()
            lists.append(mergeTwoLists(first, second))
        }
        return lists[0]
    }
//    
//    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
//
//        let head = ListNode(0)
//        var node = head;
//        var array:[ListNode] = []
//        for inputNode in lists {
//            if let inputNode = inputNode {
//                array.append(inputNode)
//            }
//        }
////        buildHeap(&array)
//        array.sort()
//        while array.count > 1 {
//            node.next = array[0]
//            node = node.next!;
//            //如果头直接还有下一个元素的话
//            if let next = node.next {
//                array[0] = next
//                array.sort()
//            } else {
//                //把最后一个元素放到第一个元素
//                array[0] = array.last!
//                array.removeLast()
//                array.sort()
//            }
//        }
//        if (array.count > 0) {
//            node.next = array[0]
//        }
//        return head.next
//    }
    
    
}

let solution = Solution();
solution.mergeKLists([])


