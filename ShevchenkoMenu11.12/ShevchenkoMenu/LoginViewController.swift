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
        createNotification()
        configureViews()
        configureConstraints()
        
    }
    
    func createNotification(){
        removeNotifications(withIdentifiers: ["CookPush"])
    
        for indexPush in 0..<Schedule.count{
        let content = UNMutableNotificationContent()
        content.title = "👩‍🍳 It's time to cook! "
        content.subtitle = TimeNames[indexPush]
        content.body = "You have an hour before eating"
        content.sound = UNNotificationSound.default
        
        var date = DateComponents()
        let currentHour = Calendar.current.component(.hour, from: Schedule[indexPush])
        let currentMinute = Calendar.current.component(.minute, from: Schedule[indexPush])
        if currentHour == 0 {
            date.hour = 23
        } else {
            date.hour = currentHour - 1
        }
        date.minute = currentMinute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        
        let request = UNNotificationRequest(identifier: "CookPush", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request)
        }
    }
    
    func removeNotifications(withIdentifiers identifiers: [String]){
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: identifiers)
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
