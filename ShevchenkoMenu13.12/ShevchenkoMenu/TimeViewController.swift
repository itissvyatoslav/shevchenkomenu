//
//  TimeViewController.swift
//  ShevchenkoMenu
//
//  Created by user on 02/12/2019.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit
import UserNotifications

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
    
    func createNotification(){
        removeNotifications(withIdentifiers: ["CookPush"])
        print("Create Not")
        
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
            
            let request = UNNotificationRequest(identifier: "CookPush\(indexPush)", content: content, trigger: trigger)
            let center = UNUserNotificationCenter.current()
            center.add(request)
        }
    }
    
    func removeNotifications(withIdentifiers identifiers: [String]){
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    @objc func addTime(){
        addTimeToSchedule(time: datePicker!.date, name: nameTextField.text ?? "")
        self.navigationController?.popViewController(animated: true)
        createNotification()
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
