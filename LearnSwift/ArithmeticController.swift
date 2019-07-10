//
//  ArithmeticController.swift
//  LearnSwift
//
//  Created by zrq on 2019/6/28.
//  Copyright © 2019 com.baidu.www. All rights reserved.
//

import UIKit

class ArithmeticController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        merger()///归并操作
    }

}

// MARK: - 归并操作
extension ArithmeticController{
    func merger(){
        let test = [12,12,23,4,55,20,45]
        let result = mergeSort(test)
        print("归并操作后"+"\(result)")
    }
    fileprivate func mergeSort(_ array: Array<Int>) -> Array<Int>{
        ///将数组中的每一个元素放入一个数组中
        var tempArray: Array<Array<Int>> = []
        for item in array {
            var subArray: Array<Int> = []
            subArray.append(item)
            tempArray.append(subArray)
        }
        ///对这个数组中的数组进行合并，知道合并完成为止
        while tempArray.count != 1 {
            var i = 0
            while i < tempArray.count - 1{
                ///合并并移除多余位置 位置+1操作
              tempArray[i] = _mergeArray(tempArray[i], tempArray[i+1])
                tempArray.remove(at: i+1)
                i = i + 1
            }
            
        }
        return tempArray.first!
    }
    fileprivate func _mergeArray(_ firstArray: Array<Int>,_ secondArray: Array<Int>) ->Array<Int>{
        var resultArray: Array<Int> = []
        var firstIndex = 0
        var secondIndex = 0
        while firstIndex < firstArray.count && secondIndex < secondArray.count {
            if firstArray[firstIndex] < secondArray[secondIndex]{
                resultArray.append(firstArray[firstIndex])
                firstIndex += 1
            }else{
                resultArray.append(secondArray[secondIndex])
                secondIndex += 1
            }
        }
        while firstIndex < firstArray.count {
            resultArray.append(firstArray[firstIndex])
            firstIndex += 1
        }
        while secondIndex < secondArray.count {
            resultArray.append(secondArray[secondIndex])
            secondIndex += 1
        }
        return resultArray
    }
}
// MARK: - 快速排序
extension ArithmeticController{
    func quickSortTest(){
        var test = [1,12,34,4,5,20,45]
        print("快速排序"+"\(quickSort(&test, 0, test.count - 1))")
    }
    //快速排序
    func quickSort(_ arr:inout [Int],_ left:Int,_ right:Int) {
        
        var l = left
        var r = right
        
        if l < r  {
            while l < r {
                
                while arr[r] >= arr[left] && l < r{
                    r -= 1
                }
                
                while arr[l] < arr[left] && l < r{
                    l += 1
                }
                
                if l < r {
                    _swap(&arr, l, r)
                }
                
            }
            _swap(&arr, left, l)
            quickSort(&arr,left,l)
            quickSort(&arr,l+1,right)
            print(arr as NSArray)
        }
        
    }
    
    //交换两个数
    func _swap(_ arr:inout [Int],_ left:Int,_ right:Int){
        let temp = arr[left]
        arr[left] = arr[right]
        arr[right] = temp
    }
}
// MARK: - 二叉树算法
extension ArithmeticController{
    
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
}
