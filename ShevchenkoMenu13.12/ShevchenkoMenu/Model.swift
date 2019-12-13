//
//  Model.swift
//  ShevchenkoMenu
//
//  Created by user on 27/11/2019.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation

var SelectedIndex: Int?

struct Dish {
    var name: String
    var type: Int
    var recipe: String
}

struct timeSetter{
    var time: Date
    var name: String
}

var Schedule = [Date]()
let keySchedule = "keySchedule"

var TimeNames = [String]()
let keyTimeNames = "keyTimeNames"

var DishNames = [String]()
let keyDishNames = "keyDishNames"

var DishTypes = [Int]()
let keyDishTypes = "keyDishTypes"

var DishRecipes = [String]()
let keyDishRecipes = "keyDishRecipes"


var Menu = [Dish]()

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

func addDishToMenu(_ newName: String, _ newType: Int, _ newRecipe: String){
    DishNames.append(newName)
    DishTypes.append(newType)
    DishRecipes.append(newRecipe)
    saveData()
}

func removeDish(at indexOfRemoving: Int){
    DishNames.remove(at: indexOfRemoving)
    DishTypes.remove(at: indexOfRemoving)
    DishRecipes.remove(at: indexOfRemoving)
    saveData()
}

func NameTypeOfDish(typeRaw: Int) -> String{
    switch typeRaw {
    case 0:
        return "Breakfast"
    case 1:
        return "Lunch"
    case 2:
        return "Dinner"
    default:
        return "Oops"
    }
}

func saveData(){
    UserDefaults.standard.set(Schedule, forKey: keySchedule)
    UserDefaults.standard.set(TimeNames, forKey: keyTimeNames)
    UserDefaults.standard.set(DishNames, forKey: keyDishNames)
    UserDefaults.standard.set(DishTypes, forKey: keyDishTypes)
    UserDefaults.standard.set(DishRecipes, forKey: keyDishRecipes)
    UserDefaults.standard.synchronize()
    setUpMenu()
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
    if let loadedSchedule = UserDefaults.standard.array(forKey: keyDishNames) as? [String]{
        DishNames = loadedSchedule
    } else {
        DishNames = []
    }
    if let loadedSchedule = UserDefaults.standard.array(forKey: keyDishTypes) as? [Int]{
        DishTypes = loadedSchedule
    } else {
        DishTypes = []
    }
    if let loadedSchedule = UserDefaults.standard.array(forKey: keyDishRecipes) as? [String]{
        DishRecipes = loadedSchedule
    } else {
        DishRecipes = []
    }
    
    setUpMenu()
    
}

func setUpMenu() {
    Menu = []
    for index in 0..<DishNames.count{
         let newDish = Dish(name: DishNames[index], type: DishTypes[index], recipe: DishRecipes[index])
         Menu.append(newDish)
     }
}

var filteredMenu = [Dish]()
var isFiltr = false
