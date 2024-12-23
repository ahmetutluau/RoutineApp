//
//  AppPages.swift
//  RoutineApp
//
//  Created by Ahmet Utlu on 22.12.2024.
//

import SwiftUI

enum AppPages: Hashable {
    case home
    case routineDetail(routine: Routine)
}

enum Sheet: Identifiable {
    var id: String {
        switch self {
        case .addToList:
            return "addToList"
        }
    }
    
    case addToList(routineTasks: Set<RoutineTask>)
}

enum FullScreenCover: String, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case placeHolder
}
