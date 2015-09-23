//
//  MulSelViewCell.swift
//  TextField+InputView
//
//  Created by 成林 on 15/8/31.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

class MulSelViewCell: UITableViewCell {
    
    @IBOutlet weak var showLabel: UILabel!
    
    @IBOutlet weak var checkImgV: UIImageView!
    @IBOutlet weak var imgVWC: NSLayoutConstraint!
    
    
    
    var dataModel: MulSelTFDataModelProtocol!{didSet{dataFill()}}
}


extension MulSelViewCell{
    
    static var rid : String {return "MulSelViewCell"}
    
    class func reuseCell(tableView tableView: UITableView) -> MulSelViewCell{
        var cell: AnyObject? = tableView.dequeueReusableCellWithIdentifier(rid)
        if cell == nil {cell = NSBundle.mainBundle().loadNibNamed(rid, owner: nil, options: nil).first}
        return cell as! MulSelViewCell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkImgV.image = UIImage(named: "resource.bundle/uncheck")
        checkImgV.highlightedImage = UIImage(named: "resource.bundle/check")
        self.selectionStyle = UITableViewCellSelectionStyle.None
        checkImgV.layer.cornerRadius = imgVWC.constant * 0.5
        checkImgV.layer.masksToBounds=true
    }
    
    
    func dataFill(){
        if dataModel == nil {return}
        showLabel.text = dataModel?.title
        if dataModel.isRequired! {checkImgV.highlighted=true}
        else{checkImgV.highlighted = dataModel.isChecked}
        
    }
    
    
    func toggle(){
        if dataModel.isRequired! {return}
        dataModel.isChecked = !dataModel.isChecked
        dataFill()
    }
}
