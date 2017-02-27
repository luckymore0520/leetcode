//: Playground - noun: a place where people can play

import UIKit
//
//Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
//
//Subscribe to see which companies asked this question.


//链接两个有序链表

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

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
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
}
