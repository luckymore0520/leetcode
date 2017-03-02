//: Playground - noun: a place where people can play

import UIKit
//
//Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
//
//k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.
//
//You may not alter the values in the nodes, only nodes itself may be changed.
//
//Only constant memory is allowed.
//
//For example,
//Given this linked list: 1->2->3->4->5
//
//For k = 2, you should return: 2->1->4->3->5
//
//For k = 3, you should return: 3->2->1->4->5
//
//Subscribe to see which companies asked this question.
extension ListNode: CustomStringConvertible {
    public var toString: String {
        var desc = "\(val)"
        var next = self.next
        while next != nil {
            desc += "->\(next!.val)"
            next = next!.next
        }
        return desc
    }
    
    public var description: String {
        var desc = "\(val)"
//        var next = self.next
//        while next != nil {
//            desc += "->\(next!.val)"
//            next = next!.next
//        }
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



class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if (k <= 1) {
            return head
        }
        guard let next = head?.next else {
            return head
        }
        //考虑剩下的如果小于k 则不用翻转
        var testNext: ListNode? = next
        for _ in 1...k-1 {
            if (testNext == nil ) {
                return head
            }
            testNext = testNext?.next
        }
        
        var last = head
        var current : ListNode? = next
        for _ in 1...k-1 {
            let tmp = current?.next;
            current?.next = last
            last = current
            current = tmp;
            if (current == nil) {
                break;
            }
        }
        head?.next = reverseKGroup(current, k)
        return last
    }
}

let solution = Solution()
let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)
node4.next = node5
node3.next = node4
node2.next = node3
node1.next = node2
solution.reverseKGroup(node1, 3)?.toString