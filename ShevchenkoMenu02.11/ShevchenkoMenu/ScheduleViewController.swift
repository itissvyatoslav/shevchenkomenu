//
//  ScheduleViewController.swift
//  ShevchenkoMenu
//
//  Created by user on 29/11/2019.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit



class ScheduleViewController: UIViewController, URLSessionDataDelegate{
  
    @IBOutlet weak var addTimeButton: UIBarButtonItem!
    @IBOutlet weak var schedule: UITableView!
    
    let idCell = "ScheduleCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schedule.dataSource = self
        
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Schedule"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        schedule.rowHeight = 80
        schedule.isEditing = true
        
        configureViews()
        configureConstraints()    
    }
    
    func configureViews(){
        schedule.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureConstraints(){
        NSLayoutConstraint.activate([
        schedule.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        schedule.topAnchor.constraint(equalTo: view.topAnchor),
        schedule.leftAnchor.constraint(equalTo: view.leftAnchor),
        schedule.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    
    func onGoTapped(_ sender: Any){
        performSegue(withIdentifier: "Register", sender: self)
    }
    
}

//class TableCell: UITableViewCell{
//    private let timeLabel: UILabel = UILabel(frame: .zero)
//
//    init() {
//        super.init(style: .default, reuseIdentifier: nil)
//        commonInit()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        commonInit()
//    }
//
//    private func commonInit(){
//        contentView.addSubview(timeLabel)
//        timeLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            timeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5.0),
//            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0),
//            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//        ])
//    }
//}

extension ScheduleViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Schedule.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: idCell)
        cell.textLabel?.text = "Time"
        cell.detailTextLabel?.text = "Type"
        return cell
    }
    
    
}


