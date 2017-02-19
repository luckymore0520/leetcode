//: Playground - noun: a place where people can play

import UIKit
class Stack<T>:CustomStringConvertible{
    var stack: [T]
    init(){
        stack = [T]()
    }
    var description: String {
        return stack.description;
    }
    func push(element:T){
        stack.append(element)
    }
    func pop() -> T?{
        if (stack.isEmpty) {
            return nil;
        }
        return stack.removeLast()
    }
    func isEmpty() -> Bool {
        return stack.isEmpty;
    }
    func peek() -> T? {
        return stack.last
    }
    func size() -> Int {
        return stack.count;
    }
}

class Queue<T>{
    var queue: [T]
    
    init(){
        queue = [T]()
    }
    func pushBack(element:T){
        queue.append(element)
    }
    func popFront() -> T?{
        if (queue.isEmpty) {
            return nil;
        }
        return queue.removeFirst()
    }
    func isEmpty() -> Bool {
        return queue.isEmpty;
    }

    func size() -> Int {
        return queue.count;
    }
}


class BinaryTreeNode<T:CustomStringConvertible>:CustomStringConvertible {
    var value: T
    var leftNode: BinaryTreeNode?
    var rightNode: BinaryTreeNode?
    init(_ value:T) {
        self.value = value;
        self.leftNode = nil;
        self.rightNode = nil;
    }
    
    var description: String {
        return value.description;
    }
    
}








func printTree(root:BinaryTreeNode<Int>) {
    let queue = Queue<BinaryTreeNode<Int>>();
    queue.pushBack(element: root);
    func printFromQueue() {
        guard let node = queue.popFront() else {
            return;
        }
        print(node.value, terminator: " ")
        if let left = node.leftNode {
            queue.pushBack(element: left)
        }
        if let right = node.rightNode {
            queue.pushBack(element: right);
        }
        printFromQueue()

    }
    printFromQueue()

}

func buildTree(preorder:[Int], inorder:[Int]) -> BinaryTreeNode<Int>? {
    if (preorder.isEmpty || inorder.isEmpty) {
        return nil;
    }
    let root = BinaryTreeNode(preorder[0]);
    if (preorder.count > 1) {
        var rootIndexInInOrder = 0;
        //找到左子数的先序遍历
        while (inorder[rootIndexInInOrder] != preorder[0]) {
            rootIndexInInOrder += 1;
        }
        if (rootIndexInInOrder > 0) {
            let leftPreorder = Array(preorder[1...rootIndexInInOrder]);
            let leftInorder = Array(inorder[0...(rootIndexInInOrder-1)]);
            root.leftNode = buildTree(preorder: leftPreorder, inorder: leftInorder)
        }
        if (rootIndexInInOrder < preorder.count - 1) {
            let rightPreorder = Array(preorder[(rootIndexInInOrder+1)...preorder.count-1]);
            let rightInorder = Array(inorder[(rootIndexInInOrder+1)...inorder.count-1]);
            root.rightNode = buildTree(preorder: rightPreorder, inorder: rightInorder)
        }
        
    }
    
    return root;
}

func verifySequenceOfBST(sequence:[Int]) -> Bool{
    
    guard let root = sequence.last else {
        return true
    }
    //长度小于3 返回 true
    if (sequence.count <= 3) {
        return true
    }
    
    func partiton(value:Int, sequence:[Int]) -> (left:[Int],right:[Int]){
        var partition:Int = -1;
        for i in 0...sequence.count-1 {
            if (sequence[i] >= value) {
                //找到分割点，最后一个是root
                partition = i;
                break;
            }
        }
        let leftPart = partition >= 0 ? []: Array(sequence[0...partition-1])
        let rightPart = partition >= (sequence.count - 1) ? [] : Array(sequence[partition...sequence.count-2])
        return (leftPart,rightPart);
    }
    
    func compare(value:Int, sequence:[Int], valid:(Int,Int)->Bool) -> Bool{
        for number in sequence {
            if (!valid(value,number)) {
                return false
            }
        }
        return true;
    }
    
    
    let (left,right) = partiton(value: root, sequence: sequence)
    if (compare(value: root, sequence: left) { $0>$1 } &&
        compare(value: root, sequence: right) { $0<$1 } ) {
        return verifySequenceOfBST(sequence: left) && verifySequenceOfBST(sequence: right)
    }

    
    return false;
}

func findPath(root:BinaryTreeNode<Int>, expectedSum:Int) {
    let stack = Stack<BinaryTreeNode<Int>>();
    func findPath(root:BinaryTreeNode<Int>, expectedSum:Int, currentSum:Int) {
 
        let sum = currentSum + root.value;
        //如果小了push进去，分别检查左边和右边
        if (sum < expectedSum) {
            stack.push(element:root);
            if let leftNode = root.leftNode {
                findPath(root: leftNode, expectedSum: expectedSum, currentSum: sum);
            }
            if let rightNode = root.rightNode {
                findPath(root: rightNode, expectedSum: expectedSum, currentSum: sum);
            }
            stack.pop();
        } else {
            if (sum == expectedSum){
                stack.push(element: root);
                print(stack)
                stack.pop()
            }
        }
    }
    findPath(root: root, expectedSum: expectedSum, currentSum: 0)
}




//verifySequenceOfBST(sequence: [7,4,6,5])
//verifySequenceOfBST(sequence: [5,7,6,9,11,10,8])
//let preorder = [1,2,4,7,3,5,6,8]
//let inorder = [4,7,2,1,5,3,8,6];
//let tree = buildTree(preorder: preorder, inorder: inorder);
//printTree(root: tree!)
//
//let preorder = [10,5,4,7,12]
//let inorder = [4,5,7,10,12];
//let tree = buildTree(preorder: preorder, inorder: inorder);
//findPath(root: tree!, expectedSum: 22)
