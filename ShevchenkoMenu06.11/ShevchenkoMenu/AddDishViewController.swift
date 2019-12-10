//
//  AddDishViewController.swift
//  ShevchenkoMenu
//
//  Created by user on 09/12/2019.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class AddDishViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        configureConstraints()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addDish))
        navigationItem.rightBarButtonItem = doneButton

    }
    
    @objc func addDish(){
//        Добавление блюда в меню
        self.navigationController?.popViewController(animated: true)
    }
    
    func configureViews(){
        
    }
    
    func configureConstraints(){
        
    }
}
