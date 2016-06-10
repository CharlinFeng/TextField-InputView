//
//  DatePickerVC.swift
//  UITextField+InputView
//
//  Created by 冯成林 on 15/9/7.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

class DatePickerVC: UIViewController {
    
    @IBOutlet weak var tf: DatePickerTF!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tf.setDateTimeInterval(1340199504)
        tf.selectedDateClosure = { (picker,dateString,dateInterval) in
        
            print("\(picker),\(dateString),\(dateInterval)")
        }
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        print("\(tf.selectedDateString),\(tf.selectedDateTimeInterval)")
    }

}
