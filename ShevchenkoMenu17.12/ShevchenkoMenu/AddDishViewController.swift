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
        
        if selectedIndex == nil {
            self.navigationItem.title = "New Dish"
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addDish))
            navigationItem.rightBarButtonItem = doneButton
        } else if menuIsFiltered == false {
            setSave()
            nameField.text = menu[selectedIndex!].name
            recipeView.text = menu[selectedIndex!].recipe
            typeSegmentedControl.selectedSegmentIndex = menu[selectedIndex!].type
            
        } else {
            setSave()
            nameField.text = filteredMenu[selectedIndex!].name
            recipeView.text = filteredMenu[selectedIndex!].recipe
            typeSegmentedControl.selectedSegmentIndex = filteredMenu[selectedIndex!].type
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
        dishNames[selectedIndex!] = editedName
        dishTypes[selectedIndex!] = editedType
        dishRecipes[selectedIndex!] = editedRecipe
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
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameField.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        recipeView.translatesAutoresizingMaskIntoConstraints = false
        recipeLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureConstraints(){
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            
        ])
    }
}
