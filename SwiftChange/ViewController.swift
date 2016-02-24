//
//  ViewController.swift
//  SwiftChange
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 Fjnu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }
    
}
// MARK: - Swift tips 尝试


// MARK: - Currying
// 柯里化 Currying
func addTwoNumbers(a: Int)(num: Int) ->Int {
    
    return a + num
    
}


// 具体使用 swifter tips 将一个方法分成两次连接 具体开发中使用 还不清楚

    let addFour = addTwoNumbers(4)
    let addSix = addFour(num: 6)


//MARK: - mutating 常量的尝试
// mutating 作用是 是否允许 struct 或者 enume 修改接口中的变量 并且 mutating 对class 是完全透明的 因为class是可以随意修改自己的成员变量

protocol Vehicle {
    
    var color: UIColor {
        get set
    }
    
    mutating func colorChange()
}

struct MyCar: Vehicle {
    
    var color = UIColor.blueColor()
    
    mutating func colorChange() {
        
        color = UIColor.redColor()
        
    }
}

//MARK: - Generators与Sequences 构成了 Swift式循环

// Generators
// 任意一个Generators需要遵从如下协议
protocol GeneratorType {
    typealias Element
    func next() -> Element?
}
// 具体使用 好处是啥，我的总结是把一个很抽象遍历模式使用Generators的方式剥离出来，当你对当前的迭代循环方式不爽的时候只需要修改一下当前的这个generator。更直观的“头疼医头，脚疼医脚”

class CountDownGenerator: GeneratorType {
    typealias Element = Int
    var element: Element
    
    init<T>(array: [T]) {
        self.element = array.count - 1
    }
    
    func next() -> CountDownGenerator.Element? {
        
        return self.element < 0 ? nil : element--
        
    }
}

// Sequences

//Generators在循环过程中每个元素提供的服务是一次性的。所以我们想做倒回操作的话需要生成一个新的generator。若不想这样则需要用上sequence，其遵从另外一个协议SequenceType：

protocol SequenceType {
    typealias Generator: GeneratorType
    func generate() -> Generator
}

//通过协议我们知道每个sequence都与一个generator类型已经一个generator构造器绑定在一起。我们可以使用这个遍历sequence。不用每次进行Loop操作的时候都去生成一个新的generator，提升代码的统一性。

//我们可以使用CountdownGenerator来定义一个sequence从而生成一个倒序的数组.

struct ReverseSequence<T>: SequenceType {
    var array: [T]
    init(array: [T]) {
        self.array = array
    }
    
    typealias Generator = CountDownGenerator
    
    func generate() -> ReverseSequence.Generator {
        return CountDownGenerator(array: array)
    }
}


//MARK: - Tuple 

func swapMe<T>(inout a: T,inout b: T) {
    (a,b) = (b,a)
}

//由于C系语言的单一返回,我们不得不通过传入指针的方式让方法来填充需要的部分,因此可以使用多元组的方式来同时返回多个部分

extension CGRect {
    //---
    
    
    func divide(atDistance: CGFloat,fromEdge: CGRectEdge) -> (slice: CGRect, remainder: CGRect){
        
        let small: CGRect = CGRect()
        let large: CGRect = CGRect()
        return (small,large)
    }
    
    //---
}



//MARK: - @autoclosure 和 ??












