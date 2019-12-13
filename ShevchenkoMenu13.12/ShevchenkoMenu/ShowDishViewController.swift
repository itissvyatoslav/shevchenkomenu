//
//  ShowDishViewController.swift
//  ShevchenkoMenu
//
//  Created by user on 09/12/2019.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class ShowDishViewController: UIViewController{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var recipeField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeField.isEditable = false
        ShowDish(SelectedIndex!)
        configureViews()
        configureConstraints()
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editDish))
        navigationItem.rightBarButtonItem = editButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ShowDish(SelectedIndex!)
        super.viewWillAppear(animated)
    }
    
    @objc func editDish(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddDishViewController") as! AddDishViewController
               self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func ShowDish(_ indexDish: Int){
        if isFiltr == true{
            nameLabel.text = filteredMenu[indexDish].name
            typeLabel.text = NameTypeOfDish(typeRaw: filteredMenu[indexDish].type)
            recipeField.text = filteredMenu[indexDish].recipe
        } else {
            nameLabel.text = Menu[indexDish].name
            typeLabel.text = NameTypeOfDish(typeRaw: Menu[indexDish].type)
            recipeField.text = Menu[indexDish].recipe
        }
    }
    
    func configureViews(){
        
    }
    
    func configureConstraints(){
        
    }
}
