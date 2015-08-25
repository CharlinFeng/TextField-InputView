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
    var selectedPickerViewValue: Any!
    var selectedAction: ((row: Int)->Void)!
    var doneBtnActionClosure: ((row: Int,value: Any!)->Void)!
    
    /**  Inner: orinal  */
    private var titles: [String]!
    private lazy var pickerView: UIPickerView = {UIPickerView()}()
    private lazy var accessoryView: AccessoryView = {AccessoryView.instance()}()
    
    
    /**  Inner: model  */
    private var models: [PickerDataModelProtocol]!
    
    /**  common  */
    private var isModelData: Bool = false
    
}

extension PickerTextField: UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate{
    
    /**  添加一个单列的原始值的pickerView  */
    func addOneColPickerViewWithTitles(titles: [String]){
        
        isModelData = false
        
        if self.placeholder == nil {self.placeholder = "请选择"}
        
        //记录
        self.titles = titles
        
        pickerView.dataSource = self
        pickerView.delegate = self
        self.inputView = pickerView
    
        self.inputAccessoryView = accessoryView
        
        accessoryView.doneBtnActionClosure = { [unowned self] in
        
            self.endEditing(true)
            self.doneBtnActionClosure?(row: self.pickerView.selectedRowInComponent(0),value: self.selectedPickerViewValue)
        }
        
        bgColorSet()
        
        self.delegate = self
    }
    
    
    /**  单列模型  */
    func addOneColPickerViewWithModels(models: [PickerDataModelProtocol]){
        
        isModelData = true
        
        if self.placeholder == nil {self.placeholder = "请选择"}
        
        //记录
        self.models = models
        
        pickerView.dataSource = self
        pickerView.delegate = self
        self.inputView = pickerView
        
        self.inputAccessoryView = accessoryView
        
        accessoryView.doneBtnActionClosure = { [unowned self] in
            
            self.endEditing(true)
            self.doneBtnActionClosure?(row: self.pickerView.selectedRowInComponent(0),value: self.selectedPickerViewValue)
        }
        
        bgColorSet()
        
        self.delegate = self
    }
    
    
    
    private func bgColorSet(){pickerView.backgroundColor = pickerViewBgColor}
    private func msgSet(){accessoryView.msgLabel.text = message}
    private func removeSet(){if removeAccessoryView {self.inputAccessoryView = nil}}
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return isModelData ? models.count : titles.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return isModelData ? models[row].title : titles[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedAction?(row: row)
        selectedPickerViewValue = isModelData ? models[row] : titles[row]
        text = isModelData ? models[row].title : titles[row]
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if text.isEmpty {pickerView(pickerView, didSelectRow: 0, inComponent: 0)}
    }
    
    override func caretRectForPosition(position: UITextPosition!) -> CGRect {return CGRectZero}

    
}