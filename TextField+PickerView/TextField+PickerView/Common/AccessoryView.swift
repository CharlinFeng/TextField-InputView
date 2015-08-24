//
//  S.swift
//  TextFieldWithPickerView
//
//  Created by 成林 on 15/8/24.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

class AccessoryView: UIView {
    
    @IBOutlet weak var msgLabel: UILabel!
    
    @IBOutlet weak var doneBtn: UIButton!

    var doneBtnActionClosure: (Void->Void)!
    
}


extension AccessoryView{
    
    @IBAction func doneBtnAction(sender: UIButton) {doneBtnActionClosure?()}
    
    static func instance()->AccessoryView{return NSBundle.mainBundle().loadNibNamed("AccessoryView", owner: nil, options: nil).first as! AccessoryView}
}
