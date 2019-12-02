//
//  TimeViewController.swift
//  ShevchenkoMenu
//
//  Created by user on 02/12/2019.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController{
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pushLabel: UILabel!
    @IBOutlet weak var pushSwitch: UISwitch!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        configureConstraints()
        
        datePicker.datePickerMode = .time
        let localeID = Locale.preferredLanguages.first
        datePicker.locale = Locale(identifier: localeID!)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addTime))
        navigationItem.rightBarButtonItem = doneButton
        
    }
    
    @objc func addTime(){
        
    }
    
    func configureViews(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        pushLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        pushSwitch.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureConstraints(){
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 15),
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),

            nameTextField.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 15),
            nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 10),
            nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),

            pushLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            pushLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),

            pushSwitch.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            pushSwitch.centerYAnchor.constraint(equalTo: pushLabel.centerYAnchor)

        ])
        
        
    }
}
