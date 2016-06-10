//
//  InputViewTextField.swift
//  TextField+InputView
//
//  Created by 成林 on 15/8/31.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

class InputViewTextField: UITextField {
    
    lazy var accessoryView: AccessoryView = {AccessoryView.instance()}()
    private lazy var btn = UIButton()
    var emptyDataClickClosure:(Void->Void)?
    
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
        
        //添加监听
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(noti_textFieldDidBeginEditing), name: UITextFieldTextDidBeginEditingNotification, object: self)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(noti_textFieldDidEndEditing), name: UITextFieldTextDidEndEditingNotification, object: self)
        
        btn.addTarget(self, action: #selector(btnClick), forControlEvents: UIControlEvents.TouchUpInside)
        
        addSubview(btn)
        
        placeholder = "正在加载数据..."
    }
    
    
    deinit{NSNotificationCenter.defaultCenter().removeObserver(self)}
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        btn.frame = bounds
    }
}


extension InputViewTextField{
    
    func noti_textFieldDidBeginEditing(textField: UITextField) {}
    func noti_textFieldDidEndEditing(textField: UITextField) {}
    override func caretRectForPosition(position: UITextPosition) -> CGRect {return CGRectZero}
    
    func btnClick(){emptyDataClickClosure?()}
    
    func dataPrepare(){
        
        assert(NSThread.isMainThread(), "请在主线程中执行方法")
        
        btn.hidden = true
        placeholder = "请选择"
    }
}