//
//  MulSelVC.swift
//  TextField+PickerView
//
//  Created by 成林 on 15/8/31.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit


class Service: MulSelTFDataModelProtocol {
    
    var title: String!
    var isChecked: Bool!
    
    init(title: String,isChecked: Bool){
        
        self.title = title
        self.isChecked = isChecked
    }
}


class MulSelVC: UIViewController {
    
    @IBOutlet weak var tf: MulSelTF!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let s1 = Service(title: "翻译", isChecked: true)
        let s2 = Service(title: "司机", isChecked: true)
        let s3 = Service(title: "公关", isChecked: true)
        let s4 = Service(title: "翻译", isChecked: false)
        let s5 = Service(title: "司机", isChecked: true)
        let s6 = Service(title: "公关", isChecked: false)
        
        
        
        tf.addMulSelWithModels([s1,s2,s3,s4,s5,s6])
        
        tf.doneBtnClickClosure = {(all,checked) in
            
            
        
        }

        
    }
    
    
    
}
