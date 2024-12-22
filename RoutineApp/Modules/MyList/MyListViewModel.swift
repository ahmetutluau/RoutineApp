//
//  MyListViewModel.swift
//  RoutineApp
//
//  Created by Ahmet Utlu on 22.12.2024.
//

import Foundation

protocol MyListViewModelProtocol: ObservableObject {
    var myLists: [MyList] { get set }
    var routines: Set<RoutineTask> { get set }
    func addRoutinesToList(index: Int)
    func addToNewList(title: String, image: String)
}

final class MyListViewModel: MyListViewModelProtocol {
    @Published var myLists: [MyList] = []
    var routines: Set<RoutineTask>
    private var manager: MyListManager
    
    init(routines: Set<RoutineTask>, manager: MyListManager) {
        self.routines = routines
        self.manager = manager
        self.myLists = manager.myLists
    }
    
    func addRoutinesToList(index: Int) {
        manager.updateList(myLists[index], with: routines)
        self.myLists = manager.myLists
    }
    
    func addToNewList(title: String, image: String) {
        manager.addToNewList(title: title, image: image, routines: routines)
        myLists = manager.myLists
    }
}
