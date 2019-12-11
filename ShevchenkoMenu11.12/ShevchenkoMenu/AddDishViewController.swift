//
//  AddDishViewController.swift
//  ShevchenkoMenu
//
//  Created by user on 09/12/2019.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class AddDishViewController: UIViewController{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var recipeView: UITextView!
    @IBOutlet weak var recipeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "New Dish"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        configureViews()
        configureConstraints()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addDish))
        navigationItem.rightBarButtonItem = doneButton

    }
    
    @objc func addDish(){
        let nameOfNewDish = nameField?.text ?? " "
        let typeOfNewDish = typeSegmentedControl.selectedSegmentIndex
        let recipeOfNewDish = recipeView.text ?? " "
        addDishToMenu(nameOfNewDish, typeOfNewDish, recipeOfNewDish)
        self.navigationController?.popViewController(animated: true)
    }
    
    func configureViews(){
        
    }
    
    func configureConstraints(){
        
    }
}
