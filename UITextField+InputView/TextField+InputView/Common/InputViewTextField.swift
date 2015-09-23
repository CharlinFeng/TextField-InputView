//
//  InputViewTextField.swift
//  TextField+InputView
//
//  Created by 成林 on 15/8/31.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

class InputViewTextField: UITextField {
    
    /**  API  */
    var textFieldDidBeginEditClosure,textFieldDidEndEditClosure: ((textField: UITextField)->Void)!
    
    lazy var accessoryView: AccessoryView = {AccessoryView.instance()}()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //视图准备
        self.viewPrepare()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //视图准备
        self.viewPrepare()
    }
    
    /**  视图准备  */
    func viewPrepare(){
        
        self.inputAccessoryView = accessoryView
        accessoryView.doneBtnActionClosure={
            self.endEditing(true)
        }
        accessoryView.cancelBtnActionClosure={
            self.endEditing(true)
        }
        self.delegate = self
    }
}


extension InputViewTextField: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textFieldDidBeginEditClosure?(textField: textField)
    }
    func textFieldDidEndEditing(textField: UITextField) {
        textFieldDidEndEditClosure?(textField: textField)
    }
    override func caretRectForPosition(position: UITextPosition) -> CGRect {return CGRectZero}
    
    
}