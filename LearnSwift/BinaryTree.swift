//
//  BinaryTree.swift
//  LearnSwift
//
//  Created by zrq on 2019/7/10.
//  Copyright © 2019 com.baidu.www. All rights reserved.
//

import Foundation
class BinaryTreeNote {
    var value: String
    var leftChild: BinaryTreeNote?
    var rightChild: BinaryTreeNote?
    init(_ value: String) {
        self.value = value
    }
}
class BinaryTreeHelper {
    var array: [String]
    var index = -1
    init(_ array: [String]) {
        self.array = array
    }
    ///创建二叉树
    func createTree() ->BinaryTreeNote?{
        self.index = self.index + 1
        if index < self.array.count && index >= 0 {
            let value = self.array[index]
            if value == ""{
                return nil
            }else{
                let note = BinaryTreeNote(value)
                note.leftChild = createTree()
                note.rightChild = createTree()
                print(note.value,note.leftChild?.value,note.rightChild?.value)
                return note
            }
        }
        return nil
    }
    
    //先序遍历二叉树
    func preOrderTraverse(_ note:BinaryTreeNote?){
        if note == nil {
            print("#")
            return
        }
        print(note!.value)
        preOrderTraverse(note!.leftChild)
        preOrderTraverse(note!.rightChild)
    }
    
    ///中序遍历二叉树
    func inOrderTraverse(_ note: BinaryTreeNote?){
        if note == nil {
            print("#")
            return
        }
        inOrderTraverse(note!.leftChild)
        print(note!.value)
        inOrderTraverse(note!.rightChild)
    }
    ///后序遍历二叉树
    func afterOrderTraverse(_ note: BinaryTreeNote?){
        if note == nil {
            print("#")
            return
        }
        afterOrderTraverse(note!.leftChild)
        afterOrderTraverse(note!.rightChild)
        print(note!.value)
    }
    
    ///层序遍历
    func levelOrder(_ root: BinaryTreeNote?){
        var result = [[BinaryTreeNote]]()
        var level = [BinaryTreeNote]()
        level.append(root!)
        while level.count != 0 {
            result.append(level)
            var nextLevel = [BinaryTreeNote]()
            for node in level{
                if let leftNode = node.leftChild{
                    nextLevel.append(leftNode)
                }
                if let rightNode = node.rightChild{
                    nextLevel.append(rightNode)
                }
            }
            level = nextLevel
        }
        let ans = result.map{$0.map{$0.value}}
        print(ans)
    }
}
