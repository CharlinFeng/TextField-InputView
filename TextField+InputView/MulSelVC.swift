//
//  MulSelVC.swift
//  TextField+InputView
//
//  Created by 成林 on 15/8/31.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit


class Service: MulSelTFDataModelProtocol {
    
    var title: String!
    var isChecked: Bool!
    var isRequired: Bool!
    
    init(title: String,isChecked: Bool,isRequired: Bool){
        
        self.title = title
        self.isChecked = isChecked
        self.isRequired=isRequired
    }
}

class MulSelVC: UIViewController {
    
    @IBOutlet weak var tf: MulSelTF!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let s1 = Service(title: "翻译", isChecked: true,isRequired:true)
        let s2 = Service(title: "司机", isChecked: false,isRequired:false)
        let s3 = Service(title: "公关", isChecked: true,isRequired:false)
        
        tf.addMulSelWithModels([s1,s2,s3])
        
        tf.doneBtnClickClosure = {(all,checked) in
            
        }
    }
}
