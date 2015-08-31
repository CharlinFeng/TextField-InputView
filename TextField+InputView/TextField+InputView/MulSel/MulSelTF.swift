//
//  MulSel.swift
//  TextField+InputView
//
//  Created by 成林 on 15/8/31.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

protocol MulSelTFDataModelProtocol: PickerDataModelProtocol{
    var isChecked: Bool!{get set}
}


class MulSelTF: InputViewTextField {
    
    /**  API  */
    var doneBtnClickClosure: ((allModels: [MulSelTFDataModelProtocol], checkedModels: [MulSelTFDataModelProtocol])->Void)!
    
    private var models: [MulSelTFDataModelProtocol]!
    
    lazy var msView = {MulSelView.instance()}()
    
    var rowH: CGFloat = 72
    
   
    /**  模型多选  */
    func addMulSelWithModels(models: [MulSelTFDataModelProtocol]){
        
        if self.placeholder == nil {self.placeholder = "请选择 (可多选)"}
    
        self.models = models
        msView.dataList = models
        msView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, rowH * CGFloat(models.count))
        self.inputView = msView
        

        accessoryView.cancelBtnActionClosure={[unowned self] in
            
            self.endEditing(true)
        }
        
        accessoryView.doneBtnActionClosure={[unowned self] in
            
            self.endEditing(true)
            
            let allModels = models
            
            var checkedModels: [MulSelTFDataModelProtocol] = []
            
            for (i,p) in enumerate(allModels){
            
                if p.isChecked! {checkedModels.append(p)}
            }
        
            self.doneBtnClickClosure?(allModels: allModels,checkedModels: checkedModels)
           
        }
    }


}
