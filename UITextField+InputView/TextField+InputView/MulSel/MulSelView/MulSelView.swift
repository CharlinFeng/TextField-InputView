//
//  MulSelView.swift
//  TextField+InputView
//
//  Created by 成林 on 15/8/31.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

class MulSelView: UIView {
    
    var rowH: CGFloat = 72;
    
    var dataList: [MulSelTFDataModel]!{didSet{tableView.reloadData()}}
    
    @IBOutlet weak var tableView: UITableView!
}


extension MulSelView: UITableViewDataSource,UITableViewDelegate{
    
    class func instance() -> MulSelView{
        return NSBundle.mainBundle().loadNibNamed("MulSelView", owner: nil, options: nil).first as! MulSelView
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.rowHeight = rowH
        tableView.allowsMultipleSelection = true
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.separatorColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08)
        tableView.showsVerticalScrollIndicator = false
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataList == nil {return 0}
        let count = dataList.count
        tableView.scrollEnabled = count > 3
        return count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = MulSelViewCell.reuseCell(tableView: tableView)
        cell.dataModel = dataList[indexPath.row]
        cell.dataFill()
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {let cell = tableView.cellForRowAtIndexPath(indexPath) as! MulSelViewCell;cell.toggle()}
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {let cell = tableView.cellForRowAtIndexPath(indexPath) as! MulSelViewCell;cell.toggle()}
    
}