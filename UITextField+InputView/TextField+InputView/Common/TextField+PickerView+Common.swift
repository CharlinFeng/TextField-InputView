//
//  TextField+InputView+Common.swift
//  TextField+InputView
//
//  Created by 成林 on 15/8/24.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

let BgColor = UIColor(red: 41, green: 41, blue: 41, alpha: 0.75)


class PickerDataModel{
    
    var title: String!
    var modelObj: AnyObject!
    
    init(title: String!, modelObj: AnyObject!){
        self.title = title
        self.modelObj = modelObj
    }
}