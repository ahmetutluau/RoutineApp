//
//  MyList.swift
//  RoutineApp
//
//  Created by Ahmet Utlu on 22.12.2024.
//

import Foundation

struct MyList: Hashable {
    var image: String
    var title: String
    var routines: Set<RoutineTask>
}
