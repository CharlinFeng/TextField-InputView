//
//  MulSel.swift
//  TextField+InputView
//
//  Created by 成林 on 15/8/31.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

class MulSelTFDataModel: PickerDataModel{
    var isChecked: Bool!
    var isRequired: Bool!
    
    init(title: String!, isChecked: Bool!, isRequired: Bool!){
        
        super.init(title: title)
        self.isChecked = isChecked
        self.isRequired = isRequired
    }
}


class MulSelTF: InputViewTextField {
    
    /**  API  */
    var doneBtnClickClosure: ((allModels: [MulSelTFDataModel], checkedModels: [MulSelTFDataModel])->Void)!
    
    private var models: [MulSelTFDataModel]!
    lazy var msView = {MulSelView.instance()}()
    private lazy var tempArray: [Bool] = []
    var rowH: CGFloat = 72
    
   
    /**  模型多选  */
    func addMulSelWithModels(models: [MulSelTFDataModel]){
        
        if self.placeholder == nil {self.placeholder = "请选择 (可多选)"}
    
        self.models = models
        msView.dataList = models
        msView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, rowH * CGFloat(models.count))
        self.inputView = msView
        
        accessoryView.cancelBtnActionClosure={[unowned self] in
            self.endEditing(true)
            for (var i=0; i<models.count; i++){self.models[i].isChecked = self.tempArray[i]}
            self.msView.tableView.reloadData()
        }
        
        accessoryView.doneBtnActionClosure={[unowned self] in
            
            self.endEditing(true)
            let allModels = models
            var checkedModels: [MulSelTFDataModel] = []
            checkedModels = allModels.filter{$0.isChecked}
            self.doneBtnClickClosure?(allModels: allModels,checkedModels: checkedModels)
        }
    }
    
    override func textFieldDidBeginEditing(textField: UITextField) {
        super.textFieldDidBeginEditing(textField)
        tempArray = models.map{$0.isChecked!}
        msView.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: false)
    }


}
