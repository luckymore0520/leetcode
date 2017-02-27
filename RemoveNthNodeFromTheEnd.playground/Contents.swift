//: Playground - noun: a place where people can play

import UIKit

//Given a linked list, remove the nth node from the end of list and return its head.
//
//For example,
//
//Given linked list: 1->2->3->4->5, and n = 2.
//
//After removing the second node from the end, the linked list becomes 1->2->3->5.

//删除链表倒数第 N 个节点


/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */


public class ListNode:CustomStringConvertible {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
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

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let start = ListNode(0)
        start.next = head
        var fast:ListNode? = start;
        var slow:ListNode? = start;
        for _ in 1...n+1 {
            fast = fast?.next
        }
        while fast != nil {
            slow = slow?.next
            fast = fast?.next
        }
        slow?.next = slow?.next?.next
        return start.next
    }
}


let node1 = ListNode(1)
let node2 = ListNode(2)
//let node3 = ListNode(3)
//let node4 = ListNode(4)
//let node5 = ListNode(5)
//node4.next = node5
//node3.next = node4
//node2.next = node3
node1.next = node2

let solution = Solution()
solution.removeNthFromEnd(node1, 2)
