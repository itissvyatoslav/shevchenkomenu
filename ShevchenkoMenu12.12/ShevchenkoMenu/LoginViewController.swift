//
//  LoginViewController.swift
//  ShevchenkoMenu
//
//  Created by user on 22/11/2019.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit
import UserNotifications

class LoginViewController: UIViewController {
    @IBOutlet private var greetingLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        
    }
    
    private func configureViews(){
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        goButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            greetingLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            greetingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 100),
            greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            greetingLabel.topAnchor.constraint(equalTo: view.topAnchor),
            
            goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
            
        ])
    }
    
    func onGoTapped(_ sender: Any){
        performSegue(withIdentifier: "Register", sender: self)
    }
    
    
}
