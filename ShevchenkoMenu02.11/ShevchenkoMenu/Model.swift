//
//  Model.swift
//  ShevchenkoMenu
//
//  Created by user on 27/11/2019.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation

struct dish {
    var name: String
    var recipe: String
}

var Schedule = [Data]()
var Dishes = [dish]()

func addTimeToSchedule(time: Data){
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
