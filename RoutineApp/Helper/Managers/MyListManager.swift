//
//  MyListManager.swift
//  RoutineApp
//
//  Created by Ahmet Utlu on 22.12.2024.
//

import Foundation

protocol MyListManagerProtocol {
    var routines: Set<RoutineTask> { get set }
    var myLists: [MyList] { get set }
    var newListCounter: Int { get set }
    
    func addToNewList(title: String, image: String, routines: Set<RoutineTask>)
    func updateList(_ list: MyList, with routines: Set<RoutineTask>)
}

final class MyListManager: MyListManagerProtocol {
    
    // Singleton instance
    static let shared = MyListManager()

    // Private init to prevent external instantiation
    private init() {}

    // The master list of all routines
    var routines: Set<RoutineTask> = []
    
    // Counter to make unique new lists
    var newListCounter: Int = 1
    
    // The lists (Favorites, Morning tasks, etc.)
    var myLists: [MyList] = [
        MyList(image: "favorites", title: "ADD TO Favorites", routines: []),
        MyList(image: "morning", title: "MORNING TASKS", routines: []),
        MyList(image: "daily", title: "DAİLY TASKS", routines: [])
    ]
    
    // Add a new custom list
    func addToNewList(title: String, image: String, routines: Set<RoutineTask>) {
        let uniqueTitle = "\(title)\(newListCounter)"
        newListCounter += 1
        let newList = MyList(image: image, title: uniqueTitle, routines: routines)
        myLists.append(newList)
    }
    
    // Update routines in a specific list
    func updateList(_ list: MyList, with routines: Set<RoutineTask>) {
        if let index = myLists.firstIndex(of: list) {
            routines.forEach { routine in
                myLists[index].routines.insert(routine)
            }
        }
    }
}
