//
//  RoutinesDetailViewModel.swift
//  RoutineApp
//
//  Created by Ahmet Utlu on 22.12.2024.
//

import Foundation

protocol RoutinesDetailViewModelProtocol: ObservableObject {
    var routine: Routine { get }
    var selectedTasks: Set<RoutineTask> { get set }
    var isSelectAll: Bool { get set }

    func toggleSelectAll()
    func toggleTaskSelection(task: RoutineTask)
    func isTaskSelected(_ task: RoutineTask) -> Bool
}

final class RoutinesDetailViewModel: RoutinesDetailViewModelProtocol {
    var routine: Routine
    @Published var selectedTasks: Set<RoutineTask> = []
    @Published var isSelectAll: Bool = false
    
    init(routine: Routine) {
        self.routine = routine
    }
    
    // Toggle all tasks selection
    func toggleSelectAll() {
        isSelectAll.toggle()

        if isSelectAll {
            selectedTasks = Set(routine.tasks)
        } else {
            selectedTasks.removeAll()
        }
    }
    
    // Update selection for a specific task
    func toggleTaskSelection(task: RoutineTask) {
        if selectedTasks.contains(task) {
            selectedTasks.remove(task)
        } else {
            selectedTasks.insert(task)
        }
        
        // Automatically update isSelectAll if all tasks are selected
        isSelectAll = selectedTasks.count == routine.tasks.count
    }
    
    // Check if a specific task is selected
    func isTaskSelected(_ task: RoutineTask) -> Bool {
        return selectedTasks.contains(task)
    }
}
