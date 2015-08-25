//
//  One+Original.swift
//  TextField+PickerView
//
//  Created by 成林 on 15/8/24.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

class OneStringVC: UIViewController {

    @IBOutlet weak var tf: PickerTextField!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        /**  一句代码搞定  */
        tf.addOneColOriginalPickerView(["成都","北京","上海","广州"])
        
//        tf.message = "请选择城市"
//        
//        tf.pickerViewBgColor = UIColor.redColor()
//        
//        tf.selectedAction = {(row) in
//        
//            println("\(row)")
//        }
//        
//        tf.doneBtnActionClosure = {(row,value) in
//        
//            println("\(row),\(value)")
//        }
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        println("选择值：\(tf.selectedPickerViewValue)")
    }
 
}
