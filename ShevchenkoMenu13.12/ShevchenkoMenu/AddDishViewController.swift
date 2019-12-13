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
    @IBOutlet weak var nameField: UITextView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var recipeView: UITextView!
    @IBOutlet weak var recipeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        if SelectedIndex == nil {
            self.navigationItem.title = "New Dish"
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addDish))
            navigationItem.rightBarButtonItem = doneButton
        } else if isFiltr == false {
            setSave()
            nameField.text = Menu[SelectedIndex!].name
            recipeView.text = Menu[SelectedIndex!].recipe
            typeSegmentedControl.selectedSegmentIndex = Menu[SelectedIndex!].type
            
        } else {
            setSave()
            nameField.text = filteredMenu[SelectedIndex!].name
            recipeView.text = filteredMenu[SelectedIndex!].recipe
            typeSegmentedControl.selectedSegmentIndex = filteredMenu[SelectedIndex!].type
        }
        
        configureViews()
        configureConstraints()

    }
    
    func setSave(){
        self.navigationItem.title = "Edit Dish"
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveDish))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func saveDish(){
        let editedName = nameField?.text ?? " "
        let editedType = typeSegmentedControl.selectedSegmentIndex
        let editedRecipe = recipeView.text ?? " "
        DishNames[SelectedIndex!] = editedName
        DishTypes[SelectedIndex!] = editedType
        DishRecipes[SelectedIndex!] = editedRecipe
        saveData()
        self.navigationController?.popViewController(animated: true)
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
