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
        var test = [12,12,23,4,55,20,45]
        let result = quickSort(&test, 0, test.count - 1)
        print("归并操作后"+"\(result)")
    }
    func quickSort(_ arr: inout [Int],_ left: Int,_ right: Int){
        var l = left
        var r = right
        if l < r {
            while l < r{
                while arr[r] >= arr[left] && l < r{
                    r -= 1
                }
                while arr[l] < arr[left] && l < r{
                    l += 1
                }
                if l < r{
                    _swap(&arr, l, r)
                }
            }
            _swap(&arr, left, l)
            quickSort(&arr, left, l)
            quickSort(&arr, l + 1, right)
        }
        
    }
    /// 交换两个数
    ///
    /// - Parameters:
    ///   - arr: <#arr description#>
    ///   - left: <#left description#>
    ///   - right: <#right description#>
    fileprivate func _swap(_ arr: inout [Int],_ left: Int,_ right: Int){
        let temp = arr[left]
        arr[left] = arr[right]
        arr[right] = temp
    }
}
