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
        let randomTimeButton = UIBarButtonItem(title: "Random", style: .plain, target: self, action: #selector(goToRandomDish))
        navigationItem.rightBarButtonItems = [addTimeButton, randomTimeButton]
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
        
        search.searchBar.scopeButtonTitles = ["All", "Breakfast", "Lunch", "Dinner"]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SelectedIndex = nil
        super.viewWillAppear(animated)
        dishes.reloadData()
    }
    
    @objc func goToAddDish(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddDishViewController") as! AddDishViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goToRandomDish(){
        if DishNames.count == 0 {
            NoDishesError()
        } else {
            SelectedIndex = Int.random(in: 0..<DishNames.count)
            let vc = storyboard?.instantiateViewController(withIdentifier: "ShowDishViewController") as! ShowDishViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func NoDishesError() {
        let alertController = UIAlertController(
            title: "No dishes",
            message: "We can't show you any random dish☹️",
            preferredStyle: .alert)

        alertController.addAction(UIAlertAction(
            title: "Close",
            style: .default,
            handler: { _ in
                alertController.dismiss(animated: true, completion: nil)
        }))

        present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeDish(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}

extension MenuTableViewController: UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DishNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "MenuCellId")
        cell.textLabel?.text = DishNames[indexPath.row]
        cell.detailTextLabel?.text = "\(NameTypeOfDish(typeRaw: DishTypes[indexPath.row]))"
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text!)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SelectedIndex = indexPath.row
        let vc = storyboard?.instantiateViewController(withIdentifier: "ShowDishViewController") as! ShowDishViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
    
    
