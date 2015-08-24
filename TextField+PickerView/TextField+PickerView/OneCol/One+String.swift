//
//  File.swift
//  TextFieldWithPickerView
//
//  Created by 成林 on 15/8/24.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit


class PickerTextField: UITextField {
    
    /**  API  */
    var pickerViewBgColor: UIColor = BgColor{didSet{bgColorSet()}}
    var message: String!{didSet{msgSet()}}
    var removeAccessoryView: Bool = false{didSet{removeSet()}}
    var selectedPickerViewValue: String!{
    
        let row = pickerView.selectedRowInComponent(0)
        
        if row == 0 {return nil}
        
        return values[row]
    }
    var selectedAction: ((row: Int)->Void)!
    var doneBtnActionClosure: ((row: Int,value: String!)->Void)!
    
    /**  Inner  */
    private var values: [String]!
    private lazy var pickerView: UIPickerView = {UIPickerView()}()
    private lazy var accessoryView: AccessoryView = {AccessoryView.instance()}()
    private var extraValue = "请选择"
    
}

extension PickerTextField: UIPickerViewDelegate,UIPickerViewDataSource{
    
    /**  添加一个单列的原始值的pickerView  */
    func addOneColOriginalPickerView(values: [String]){
        
        if self.placeholder == nil {self.placeholder = "请选择"}
        
        //记录
        self.values = [extraValue] + values
        
        pickerView.dataSource = self
        pickerView.delegate = self
        self.inputView = pickerView
    
        self.inputAccessoryView = accessoryView
        
        accessoryView.doneBtnActionClosure = { [unowned self] in
        
            self.endEditing(true)
            self.doneBtnActionClosure(row: self.pickerView.selectedRowInComponent(0),value: self.selectedPickerViewValue)
        }
        
        bgColorSet()
    }
    
    private func bgColorSet(){pickerView.backgroundColor = pickerViewBgColor}
    private func msgSet(){accessoryView.msgLabel.text = message}
    private func removeSet(){if removeAccessoryView {self.inputAccessoryView = nil}}
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return values[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedAction?(row: row)
        self.text = row == 0 ? "" : values[row]
    }
    

    
}