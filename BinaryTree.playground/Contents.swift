//: Playground - noun: a place where people can play

import UIKit


class BinaryTreeNode {
    var value: Int
    var leftNode: BinaryTreeNode?
    var rightNode: BinaryTreeNode?
    init(_ value:Int) {
        self.value = value;
        self.leftNode = nil;
        self.rightNode = nil;
    }
    
    
}


func buildTree(preorder:[Int], inorder:[Int]) -> BinaryTreeNode? {
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

let preorder = [1,2,4,7,3,5,6,8]
let inorder = [4,7,2,1,5,3,8,6];
buildTree(preorder: preorder, inorder: inorder);

