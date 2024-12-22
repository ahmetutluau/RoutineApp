//
//  Routine.swift
//  RoutineApp
//
//  Created by Ahmet Utlu on 22.12.2024.
//

import Foundation

struct Routine: Hashable, Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let subtitle: String
    let tasks: [RoutineTask]
}

struct RoutineTask: Hashable, Identifiable{
    let id = UUID()
    let images: [String]?
    let description: String
    let subDescription: String?
    let category: String?
}
