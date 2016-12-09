//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1,let l2 = l2 else {
            return nil;
        }
        var currentValue = l1.val + l2.val;
        let result = ListNode(currentValue % 10);
        var lastNode = result;
        var l1Current = l1.next;
        var l2Current = l2.next;
        while true {
            if l1Current != nil || l2Current != nil {
                if (l1Current == nil) {
                    l1Current = ListNode(0)
                }
                if (l2Current == nil) {
                    l2Current = ListNode(0)
                }
                l1Current?.val += Int(currentValue / 10)
                currentValue = l1Current!.val + l2Current!.val;
                let next = ListNode(currentValue % 10);
                lastNode.next = next;
                lastNode = next;
                l1Current = l1Current!.next;
                l2Current = l2Current!.next;
            } else {
                if Int(currentValue / 10) > 0{
                    let next = ListNode(currentValue / 10);
                    lastNode.next = next;
                }
                break;
            }
        }
        return result;
    }
}