//
//  File.swift
//  TextFieldWithPickerView
//
//  Created by 成林 on 15/8/24.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit


class OneColTF: InputViewTextField {
    
    /**  API  */
    var pickerViewBgColor: UIColor = BgColor{didSet{bgColorSet()}}
    var message: String!{didSet{msgSet()}}
    var removeAccessoryView: Bool = false{didSet{removeSet()}}
    var selectedPickerViewValue: Any!
    var selectedAction: ((tf: InputViewTextField, row: Int, model: PickerDataModel!)->Void)!
    var doneBtnActionClosure: ((row: Int,value: Any!)->Void)!
    
    /**  Inner: orinal  */
    private var titles: [String]!
    private lazy var pickerView: UIPickerView = {UIPickerView()}()
    /**  model  */
    private var models: [PickerDataModel]!
    
    /**  common  */
    private var isModelData: Bool = false
    
}

extension OneColTF: UIPickerViewDelegate,UIPickerViewDataSource{
    
    /**  添加一个单列的原始值的pickerView  */
    func addOneColPickerViewWithTitles(titles: [String]){
        
        isModelData = false
        
        if self.placeholder == nil {self.placeholder = "请选择"}
        
        //记录
        self.titles = titles
        
        pickerView.dataSource = self
        pickerView.delegate = self
        self.inputView = pickerView
    
        accessoryView.hideCancelBtn=true
        accessoryView.doneBtnActionClosure = { [unowned self] in
        
            self.endEditing(true)
            self.doneBtnActionClosure?(row: self.pickerView.selectedRowInComponent(0),value: self.selectedPickerViewValue)
        }
        
        bgColorSet()
    }
    
    
    /**  单列模型  */
    func addOneColPickerViewWithModels(models: [PickerDataModel]!){
        
        isModelData = true
        
        if self.placeholder == nil {self.placeholder = "请选择"}
        
        //记录
        self.models = models
        
        pickerView.dataSource = self
        pickerView.delegate = self
        self.inputView = pickerView
        
        accessoryView.hideCancelBtn=true
        accessoryView.doneBtnActionClosure = { [unowned self] in
            
            self.endEditing(true)
            self.doneBtnActionClosure?(row: self.pickerView.selectedRowInComponent(0),value: self.selectedPickerViewValue)
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
        
        return isModelData ? (models?.count ?? 0) : (titles?.count ?? 0)
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return isModelData ? models[row].title : titles[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedPickerViewValue = isModelData ? models?[row] : titles?[row]
        text = isModelData ? models?[row].title : titles?[row]
        selectedAction?(tf: self, row: row, model: models[row])
    }
    
    override func noti_textFieldDidBeginEditing(textField: UITextField) {

        if (models?.count ?? 0) == 0 {return}
        
        if text == nil || text?.characters.count==0 {pickerView(pickerView, didSelectRow: 0, inComponent: 0)}
    }
    
    

    
}