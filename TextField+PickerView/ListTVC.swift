//
//  ListTVC.swift
//  TextField+PickerView
//
//  Created by 成林 on 15/8/24.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

class ListTVC: UITableViewController {
    

    let rid = "rid"

    let dataList = ["单列+原始值","单列+模型值","模型多选","更多功能请期待"]
    
}

extension ListTVC{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = (tableView.dequeueReusableCellWithIdentifier(rid) as? UITableViewCell) ?? UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: rid)
        
        cell.textLabel?.text = dataList[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.row == self.dataList.count - 1 {return}
        
        var vc: UIViewController = UIViewController()
        
        if indexPath.row == 0{
            
            vc = OneStringVC(nibName:"OneStringVC",bundle:nil)
            
        }else if indexPath.row == 1 {
            
            vc = OneModelVC(nibName:"OneModelVC",bundle:nil)
        }else if indexPath.row == 2{
            vc = MulSelVC(nibName:"MulSelVC",bundle:nil)
        }
        
        vc.title = dataList[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}

