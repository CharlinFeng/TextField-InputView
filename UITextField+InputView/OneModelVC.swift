//
//  One+Original.swift
//  TextField+InputView
//
//  Created by 成林 on 15/8/24.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

class CityModel: PickerDataModel {
    
    var spell: String!
    
    init(title: String, spell: String){
        super.init(title: title, modelObj: nil)
        self.spell = spell
    }
}


class OneModelVC: UIViewController {

    @IBOutlet weak var tf: OneColTF!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let city1 = CityModel(title: "成都市", spell: "ChengDu")
        let city2 = CityModel(title: "南充市", spell: "NanChong")
        let city3 = CityModel(title: "南部县", spell: "NanBu")

        /**  一句代码安装  */
        tf.addOneColPickerViewWithModels([city1,city2,city3])
        
    }

 
}
