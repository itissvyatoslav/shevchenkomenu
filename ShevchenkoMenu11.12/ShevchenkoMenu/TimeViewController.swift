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
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        configureConstraints()
        
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Set Time"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        datePicker.datePickerMode = .time
        let localeID = Locale.preferredLanguages.first
        datePicker.locale = Locale(identifier: localeID!)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addTime))
        navigationItem.rightBarButtonItem = doneButton
        
    }
    
    @objc func addTime(){
        addTimeToSchedule(time: datePicker!.date, name: nameTextField.text ?? "")
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func configureViews(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureConstraints(){
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 15),
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),

            nameTextField.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 15),
            nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 10),
            nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),

        ])
        
        
    }
}
