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


// 柯里化 Currying
func addTwoNumbers(a: Int)(num: Int) ->Int {
    
    return a + num
    
}


// 具体使用 swifter tips 将一个方法分成两次连接 具体开发中使用 还不清楚

    let addFour = addTwoNumbers(4)
    let addSix = addFour(num: 6)


// mutating 常量的尝试
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

// Generators与Sequences 构成了 Swift式循环





