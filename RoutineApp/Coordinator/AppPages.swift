//
//  AppPages.swift
//  RoutineApp
//
//  Created by Ahmet Utlu on 22.12.2024.
//

import SwiftUI

enum AppPages: Hashable {
    case home
    case routineDetail
}

enum Sheet: Identifiable {
    var id: String {
        switch self {
        case .addToList:
            return "addToList"
        }
    }
    
    case addToList
}

enum FullScreenCover: String, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case placeHolder
}
