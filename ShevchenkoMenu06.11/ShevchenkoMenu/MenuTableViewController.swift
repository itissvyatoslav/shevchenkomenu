//
//  MenuTableViewController.swift
//  ShevchenkoMenu
//
//  Created by user on 02/12/2019.
//  Copyright © 2019 user. All rights reserved.
//
import Foundation
import UIKit

class MenuTableViewController: UIViewController{
    @IBOutlet weak var dishes: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dishes.dataSource = self
        dishes.delegate = self
        
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Dishes"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        dishes.rowHeight = 70
        
        let addTimeButton = UIBarButtonItem(title: "Add dish", style: .plain, target: self, action: #selector(goToAddDish))
        navigationItem.rightBarButtonItem = addTimeButton
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
        
        search.searchBar.scopeButtonTitles = ["All", "Breakfast", "Lunch", "Dinner"]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dishes.reloadData()
    }
    
    @objc func goToAddDish(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddDishViewController") as! AddDishViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //           удаление ячейки
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}

extension MenuTableViewController: UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "MenuCellId")
        cell.textLabel?.text = "Hello"
        cell.detailTextLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text!)
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let tableCell = cell as? MenuCell {
            tableCell.configure()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ShowDishViewController") as! ShowDishViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
    
class MenuCell: UITableViewCell{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "idMenuCell")
        cell.textLabel?.text = "Hello!"
        cell.detailTextLabel?.text = "How are you?!"
    }
}
    
