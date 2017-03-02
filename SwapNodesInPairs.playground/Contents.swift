//: Playground - noun: a place where people can play

import UIKit

//Given a linked list, swap every two adjacent nodes and return its head.
//
//For example,
//Given 1->2->3->4, you should return the list as 2->1->4->3.
//
//Your algorithm should use only constant space. You may not modify the values in the list, only nodes itself can be changed.
//
//Subscribe to see which companies asked this question.

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



class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let next = head?.next else {
            return head
        }
        let start = ListNode(0)
        start.next = next
        head?.next = swapPairs(next.next)
        next.next = head
        return start.next
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
solution.swapPairs(node1)
