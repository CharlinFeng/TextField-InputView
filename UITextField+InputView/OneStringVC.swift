//
//  One+Original.swift
//  TextField+InputView
//
//  Created by 成林 on 15/8/24.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

class OneStringVC: UIViewController {

    @IBOutlet weak var tf: OneColTF!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        print("模拟网络数据请求，此时数据未请求成功")
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,Int64(3 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
            
            print("网络数据请求成功")
            
            /**  一句代码搞定  */
            self.tf.addOneColPickerViewWithTitles(["成都","北京","上海","广州"])
        })

        tf.emptyDataClickClosure = {
        
            print("没有数据")
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        print("选择值：\(tf.selectedPickerViewValue)")
    }
 
}
