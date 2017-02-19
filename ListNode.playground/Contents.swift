//: Playground - noun: a place where people can play

import UIKit


indirect enum LinkList<Element: Comparable & CustomStringConvertible>:CustomStringConvertible {
    case empty
    case node(Element,LinkList<Element>)
    
    func deleteNode(_ element:Element) -> LinkList<Element> {
        switch self {
            case .empty:
                return .empty
            case .node(let value, let next):
                return element == value ? next : LinkList.node(value, next.deleteNode(element))
 
        }
    }
    
    func reverse()->LinkList{
        var lastNode:LinkList = .empty;
        var currentNode:LinkList = self;
        while case let .node(value,next) = currentNode {
            lastNode = .node(value, lastNode)
            currentNode = next;
        }
        
        return lastNode;
    }
    
    var description: String {
        switch self {
        case .empty:
            return "tail";
        case .node(let value, let next):
            return value.description + "->" + next.description;
        }
    }
    
    

}

var linkList = LinkList.node(1,.node(2,.node(3,.empty)))
linkList = linkList.deleteNode(2)
linkList.reverse();









