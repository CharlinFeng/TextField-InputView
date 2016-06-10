//
//  DatePickerTF.swift
//  UITextField+InputView
//
//  Created by 冯成林 on 15/9/7.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

class DatePickerTF: InputViewTextField {
    
    enum PatternType: Int {
        case YMD = 0
    }
    
    @IBInspectable var patternType: Int = 0
    
    @IBInspectable var allowPickerEarlier: Int = 1
    
    var pattern: String!
    var selectedDateClosure: ((datePicker: UIDatePicker, selectedDateString: String, selectedDateTimeInterval: NSTimeInterval)->Void)!
    var selectedDateString: String!
    var selectedDateTimeInterval: NSTimeInterval!
    private var datePicker: UIDatePicker!
}


extension DatePickerTF{
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        dataPrepare()
        
        let str = "请您滑动控件以选取时间"
        
        accessoryView.msgLabel.text = str
        
        placeholder = str
        
        if patternType == PatternType.YMD.rawValue {pattern = "yyyy-MM-dd"}
        
        patternKVO()
        
    }
    
    func patternKVO(){
        
        accessoryView.hideCancelBtn=true
        
        datePicker = UIDatePicker()
        datePicker.backgroundColor = BgColor
        datePicker.datePickerMode=UIDatePickerMode.Date
        datePicker.locale = NSLocale(localeIdentifier: "zh_CH")
        datePicker.addTarget(self, action: #selector(selectedDatePickerRow), forControlEvents: UIControlEvents.ValueChanged)
        self.inputView=datePicker
    }
    
    
    /** 选中了时间 */
    func selectedDatePickerRow(datePicker: UIDatePicker){
        
        let date = datePicker.date;
        
        selectedDateTimeInterval = date.timeIntervalSince1970
        
        let nowDate = NSDate()
        let now = nowDate.timeIntervalSince1970
        
        if selectedDateTimeInterval < now && allowPickerEarlier == 0 {
        
            datePicker.setDate(nowDate, animated: true)
            return
        }
        
        
        selectedDateString = date.dateFormatter(pattern);
        
        selectedDateClosure?(datePicker: datePicker,selectedDateString: selectedDateString, selectedDateTimeInterval: selectedDateTimeInterval)
        
        self.text = selectedDateString
    }
    
    
    override func noti_textFieldDidBeginEditing(textField: UITextField) {
        assert(pattern != nil, "冯成林提示您：您需要设置tf.pattern属性，比如：yyyy-MM-dd")
        selectedDatePickerRow(datePicker)
    }
    
    func setDateTimeInterval(dateTimeInterval: NSTimeInterval){
        datePicker.setDate(NSDate(timeIntervalSince1970: dateTimeInterval), animated: false)
    }

}











extension NSDate{
    
    var timestamp: String {return "\(self.timeIntervalSince1970)"}
    
    func dateFormatter(pattern: String)->String{
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = pattern
        let dateString = formatter.stringFromDate(self)
        return dateString
    }
}

