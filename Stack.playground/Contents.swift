//: Playground - noun: a place where people can play

import UIKit

class MinStack<T:Comparable>:Stack<T>{
    let minStack:Stack<T>
    override init() {
        minStack = Stack<T>()
        super.init()
    }
    var minElement:T? {
        return minStack.peek();
    }
    
    override func push(element:T){
        super.push(element: element)
        minStack.push(element: min(minElement ?? element, element))

    }
    override func pop() -> T?{
        minStack.pop()
        return super.pop()
    }
}


class Stack<T>{
    var stack: [T]
    init(){
        stack = [T]()
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

func checkPopOrder<T:Comparable>(popOrder:[T],pushOrder:[T]) -> Bool {
    if (popOrder.isEmpty || pushOrder.isEmpty || pushOrder.count != popOrder.count) {
        return false;
    }
    let stack = Stack<T>();
    var pushOrder = pushOrder;
    for element in popOrder {
        let top = stack.peek()
        //如果栈顶的元素和比较的元素相等，pop，下一个
        if (element == top) {
            stack.pop()
            
        } else if (pushOrder.count > 0){
            //这里需要保证push的数组里还有，如果没有的话就肯定不符合了
            //这里如果不等于的都直接压栈
            while let elementToPush = pushOrder.first, elementToPush != element {
                stack.push(element: pushOrder.removeFirst())
                print(elementToPush)
            }
            
            //空了代表不符合了
            if (pushOrder.isEmpty) {
                return false
            }
            //否则就把第一个拿掉吧
            print(pushOrder.removeFirst());
        } else {
            return false;
        }
    }
    return true
}

checkPopOrder(popOrder:[4,3,5,1,2], pushOrder: [1,2,3,4,5] )
//
//
//let minStack = MinStack<Int>()
//minStack.push(element: 3);
//minStack.push(element: 4);
//minStack.minElement
//minStack.push(element: 0);
//minStack.minElement


