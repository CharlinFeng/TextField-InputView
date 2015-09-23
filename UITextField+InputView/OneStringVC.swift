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
        
        /**  一句代码搞定  */
        tf.addOneColPickerViewWithTitles(["成都","北京","上海","广州"])

        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        print("选择值：\(tf.selectedPickerViewValue)")
    }
 
}
