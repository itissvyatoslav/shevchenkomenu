//
//  MenuTableViewController.swift
//  ShevchenkoMenu
//
//  Created by user on 02/12/2019.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class MenuTableViewController: UIViewController{
    @IBOutlet weak var dishes: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
            self.navigationItem.title = "Dishes"
            self.navigationController?.navigationBar.prefersLargeTitles = true
            dishes.rowHeight = 70
    }
}
