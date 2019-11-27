//
//  Model.swift
//  ShevchenkoMenu
//
//  Created by user on 27/11/2019.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation

var Schedule: [String] = ["14:15", "15:00"]

func addTime(time: String){
    Schedule.append(time)
    saveData()
}

func removeTime(at index: Int){
    Schedule.remove(at: index)
    saveData()
}

func saveData(){
    
}

func loadData(){
    
}
