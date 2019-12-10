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
    var type: String
}

struct timeSetter{
    var time: Date
    var name: String
}

var Schedule = [Date]()
let keySchedule = "keySchedule"

var TimeNames = [String]()
let keyTimeNames = "keyTimeNames"


func addTimeToSchedule(time: Date, name: String){
    Schedule.append(time)
    TimeNames.append(name)
    saveData()
}

func removeTime(at index: Int){
    Schedule.remove(at: index)
    TimeNames.remove(at: index)
    saveData()
}

func saveData(){
    UserDefaults.standard.set(Schedule, forKey: keySchedule)
    UserDefaults.standard.set(TimeNames, forKey: keyTimeNames)
    UserDefaults.standard.synchronize()
    print("Data is saved")
}

func loadData(){
    if let loadedSchedule = UserDefaults.standard.array(forKey: keySchedule) as? [Date]{
        Schedule = loadedSchedule
    } else {
        Schedule = []
    }
    if let loadedSchedule = UserDefaults.standard.array(forKey: keyTimeNames) as? [String]{
        TimeNames = loadedSchedule
    } else {
        TimeNames = []
    }
    
}
