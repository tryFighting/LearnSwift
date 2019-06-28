//
//  ViewController.swift
//  LearnSwift
//
//  Created by zrq on 2019/6/3.
//  Copyright © 2019 com.baidu.www. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var dataSource: [String] = {
        let arr = ["copy-on-write","for-in,for-each","关联对象-泛型","defer","unowned--weak","高阶函数","如何拿到枚举的所有值","访问权限","group函数使用","字典/集合/数组-算法的应用","链表的应用(缓存LRU),字典的应用"]
        return arr
    }()
    lazy var tableView: UITableView = {
        let tab = UITableView(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: .plain)
        tab.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tab.backgroundColor = UIColor.white
        tab.delegate = self
        tab.dataSource = self
        view.addSubview(tab)
        return tab
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.reloadData()
    }
   
}


    /// 给一个整型数组和一个目标值，判断数组中是否有两个数字之和等于目标值
    ///
    /// - Parameters:
    ///   - nums: 整型数组
    ///   - target: 目标值
    /// - Returns: 返回的布尔值
    func arithmetic(nums: [Int],target: Int) -> Bool {
        var numSet: Set = Set<Int>()
        
        for item in nums {
            if numSet.contains(target - item){
                return true
            }
            numSet.insert(item)
        }
        return false
    }
    
    func frequency() {
        print(Dictionary("hello".map { ($0, 1) }, uniquingKeysWith: +))
    }
    /// 给定一个整型数组中有且仅有两个数字之和等于目标值，求两个数字在数组中的序号
    ///
    /// - Parameters:
    ///   - nums: 整型数组
    ///   - target: 目标值
    /// - Returns: 返回数组索引
    func arithmeticTwo(nums: [Int],target: Int) -> [Int] {
        var dict: Dictionary = [Int: Int]()
        for (i,num) in nums.enumerated() {
            if let lastIndex = dict[target - num]{
                return [lastIndex,i]
            }else{
                dict[num] = i
            }
        }
        fatalError("No valid output!")
    }
    /*
     给一个字符串，将其按照单词顺序进行反转。比如说 s 是 "the sky is blue",
     那么反转就是 "blue is sky the"。
     */
    fileprivate func reverse<T>(_ chars: inout [T],_ start: Int,_ end: Int){
        var start = start,end = end
        while start < end {
            swap(&chars, start, end)
            start += 1
            end -= 1
        }
    }
    fileprivate func swap<T>(_ chars: inout [T],_ p: Int,_ q: Int){
        (chars[p],chars[q]) =  (chars[q],chars[p])
    }
    fileprivate func reverseWords(s: String?) -> String?{
        ///如果字符串不存在就返回
        guard let s = s else { return nil }
        
        //将字符串转换为字符数组
        var chars = Array(s),start = 0
        ///翻转字符数组
        reverse(&chars, 0, chars.count - 1)
        print(chars)
        //遍历字符数组
        for i in 0 ..< chars.count {
            //如果下标i走到空格，知道末尾
            
            if i == chars.count - 1 || chars[i+1] == " "{
                ///反转从start到i这段数组中的字符
                reverse(&chars, start, i)
                ///start往后移，跳过空格
                start = i + 2
            }
            
        }
        return String(chars)
    }


extension ViewController: UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.backgroundColor = UIColor.white
        cell.textLabel?.text = self.dataSource[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            interview1()
        case 1:
            interview2()
        case 2:
            interview3()
        case 3:
            interview4()
        case 4:
            interview5()
        case 5:
            interview6()
        case 6:
            interview7()
        case 7:
            interview8()
        case 8:
            interview9()
        case 9:
            interview10()
        case 10:
            interview11()
        default:
            break
        }
    }
}



///1.写时复制
/// 当值类型比如struct在复制时，复制的对象和原对象实际上在内存中指向同一个对象。当且仅当复制后的对象进行修改时，才会在内存中重新创建一个新的对象
fileprivate func interview1(){
    ///arrayA是一个数组，为值类型
    let arrayA: [Int] = [1,2,3]
    ///arrayB这个时候与arrayA 在内存中是同一个东西，内存中并没有生成新的数组
    var arrayB: [Int] = arrayA
    print(address: arrayA)
    print(address: arrayB)
    //arrayB被修改了，此时arrayB被修改了，此时arrayB在内存中变成了一个新的数组，而不是原来的arrayA
    arrayB.append(4)
    arrayB.remove(at: 0)
    print(address: arrayB)
}
func print(address o: UnsafeRawPointer){
    print(String(format: "%p", Int(bitPattern: o)))
}
/// for-in能使用return break continue关键字，for-each不能使用break，continue关键字
///return 在for-in 跳出该函数 for-each跳过筛选项
/*
 let array = ["1","2","3","cat","ddd"]
 array.forEach { (element) in
 if element == "3"{
 return
 }
 print(element)
 }
 for element in array {
 if element == "3"{
 return/break跳出循环 /contimue跳出筛选项继续执行循环
 }
 print(element)
 }
 */
///for - in 使用范围更广
func interview2(){
    let array = ["1","2","3","cat","ddd"]
    for element in array {
        if element == "3"{
            continue
        }
        print(element)
    }
    print("1.for-in能使用return break continue关键字，for-each不能使用break，continue关键字\n2.return 在for-in 跳出该函数 for-each跳过筛选项\n")
}
/// 关联对象与泛型的联合使用
/*
 泛型和关联类型 调用和实现对比看
 关联类型：实现方指定类型，调用方不指定，当你实现一个使用关联类型的函数的时候，你需要填充对应的类型
 泛型:调用方指定类型，实现方不指定，当你实现一个使用泛型的函数，不需要知道调用方具体采用的类型，你可以约束险种类型
 
 */
func interview3(){
    let name: String = "Tom"
    let age: Int = 18
    let isEquals = checkEqual(left: name as NSObjectProtocol, right: age as NSObjectProtocol)
    print(isEquals)
    let lastName = "Tom"
    
    let result = checkEquals(left: name, right: lastName)
    print("泛型和关联类型 调用和实现对比看\n关联类型：实现方指定类型，调用方不指定，当你实现一个使用关联类型的函数的时候，你需要填充对应的类型\n泛型:调用方指定类型，实现方不指定，当你实现一个使用泛型的函数，不需要知道调用方具体采用的类型，你可以约束险种类型")
    print(result)
}
/// defer的用法
func interview4(){
    var fridgeIsOpen = false
    let fridgeContent = ["milk","eggs","leftovers"]
    func fridgeContains(_ food: String) -> Bool{
        fridgeIsOpen = true
        defer {
            fridgeIsOpen = false
            print("\(fridgeIsOpen)")
        }
        let result = fridgeContent.contains(food)
        return result
    }
    print(fridgeContains("eggs"))
    try?foo3()
    print("1.defer一个很适合的使用场景就是用来做清理工作\n2.重写父类方法 用defer,主要目的是在super方法之前做一些准备工作\n3.任意scope都可以有defer")
}
/// defer一个很适合的使用场景就是用来做清理工作
///重写父类方法 用defer,主要目的是在super方法之前做一些准备工作
///任意scope都可以有defer
//调用回调block
func foo1(completion: () -> Void){
    
    defer {
        completion()
    }
    //guard let <#constant#> = <#expression#> else { return <#return value#> }
    ///handle成功
}
///把 6，5，4 压栈
func foo3() throws{
    print("1")
    defer {
        print("6")
    }
    print("2")
    defer {
        print("5")
    }
    print("3")
    defer {
        print("4")
    }
}
///一个scope里的defer不一定保证一定会执行
func foo2() throws{
    do {
        throw NSError()
        print("impossible")
    }
    defer {
        print("finally")
    }
    
}
func foo(){
    ///return之前  执行defer语句
    defer {
        print("finally")
    }
    do {
        throw NSError()
        print("impossible")
    } catch  {
        print("handle error")
    }
}

func interview5(){
    print("unowned是必选相当于assign引用，weak是可选相当于弱引用，打破成环效应")
     let a1 = ArithmeticController()
     a1.merger()
    a1.quickSortTest()
}
func interview6(){
    let a = [1,2,3,4,5,6,7,8]
    print(a.map({$0*2}))
    print(a.compactMap({$0+1}))
    print(a.filter({$0/2==0}))
    print(a.reduce(100, {
        return   $0 + $1
    }))
}
func interview7(){
    
}
func interview8(){
    
}

fileprivate func interview9(){
    
    
}

/// 数组，集合，字典，字符串的应用
func interview10(){
    
    
    //将字符串转换为字符数组
    let s = "the sky is blue"
    
    print(reverseWords(s: s)!)
    
    strlen(s)
    s.count
    (s as NSString).length

  s.lowercased()
    s.uppercased()
    for (index,value) in s.enumerated() {
        print(index,value)
    }
}

/// 链表的使用
func interview11(){
    
}

///关联类型需要泛型约束
///Protocol 'Equatable' can only be used as a generic constraint because it has Self or associated type requirements
//Binary operator '==' cannot be applied to two 'Equatable' operands
///Swift协议也能够捕获一个类型和多个类型之间的关系，每个协议有一个隐式构造的关联类型的self,描述了遵守协议的类型
func checkEquals<T: Equatable>(left: T,right: T) -> Bool{
    return left == right
}
///调用NSObjectProtocol不需要泛型支持
func checkEqual(left: NSObjectProtocol,right: NSObjectProtocol)-> Bool{
    return left.isEqual(right)
}

