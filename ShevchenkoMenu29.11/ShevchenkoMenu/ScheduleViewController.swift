//
//  ScheduleViewController.swift
//  ShevchenkoMenu
//
//  Created by user on 29/11/2019.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit



class ScheduleViewController: UIViewController, URLSessionDataDelegate{
  
    private var time = ["14:15", "15:40"]
   
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var schedule: UITableView!
    //    let schedule = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Schedule"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        schedule.rowHeight = 80
        
        timePicker.datePickerMode = .time
        
        configureViews()
        configureConstraints()

        
    }
    
    func configureViews(){
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        schedule.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureConstraints(){
        NSLayoutConstraint.activate([
        timePicker.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        timePicker.leftAnchor.constraint(equalTo: view.leftAnchor),
        timePicker.rightAnchor.constraint(equalTo: view.rightAnchor),
        timePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        schedule.bottomAnchor.constraint(equalTo: timePicker.topAnchor),
        schedule.topAnchor.constraint(equalTo: view.topAnchor),
        schedule.leftAnchor.constraint(equalTo: view.leftAnchor),
        schedule.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

class TableCell: UITableViewCell{
//    private let addButton: UIButton
    private let timeLabel: UILabel = UILabel(frame: .zero)
    
    init() {
        super.init(style: .default, reuseIdentifier: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
//        contentView.addSubview(addButton)
        contentView.addSubview(timeLabel)
//        addButton.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5.0),
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            addButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 5.0),
//            addButton.leftAnchor.constraint(equalTo: contentView.rightAnchor, constant: 15.0),
//            addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            addButton.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        
//        addButton.clipsToBounds = true
    }
}


