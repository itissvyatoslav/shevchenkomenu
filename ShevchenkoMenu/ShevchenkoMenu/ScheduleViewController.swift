//
//  ScheduleViewController.swift
//  ShevchenkoMenu
//
//  Created by user on 22/11/2019.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

var Schedule = [""]

class ScheduleViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.viewDidLoad()
        
        view.backgroundColor = .lightGray
        tableView.backgroundColor = .lightGray
        
        tableView.tableFooterView = UIView(frame: .zero)
        
        
    }
    
    func createCell(){
        
    }
}
