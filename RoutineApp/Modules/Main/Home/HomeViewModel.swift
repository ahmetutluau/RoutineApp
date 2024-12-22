//
//  HomeViewModel.swift
//  RoutineApp
//
//  Created by Ahmet Utlu on 22.12.2024.
//

import Foundation

final class HomeViewModel: ObservableObject {
    let routines: [Routine] = [
        Routine(image: "routine1",
                title: "Detailed Morning Routine Tasks",
                subtitle: "Wake-Up and Hydration",
                tasks: [
                    RoutineTask(images: ["detail1", "detail2", "detail1"],
                                description: "Drink a Glass of Water",
                                subDescription: "Start with a full glass to rehydrate after sleep",
                                category: "Hydration, Health"),
                    RoutineTask(images: nil,
                                description: "Deep Breathing Exercise",
                                subDescription: "Practice deep breathing for 5 minutes",
                                category: "Breathing, Mindfulness, Calm"),
                    RoutineTask(images: nil,
                                description: "10-15 minutes of light exercise to energize",
                                subDescription: nil,
                                category: nil),
                    RoutineTask(images: nil,
                                description: "Short Walk or Jog",
                                subDescription: "Go outside for fresh air and movement",
                                category: "Outdoor, Movement")
                ]),
        Routine(image: "routine2",
                title: "Daily Workday Focus Goals and Tasks to Keep You on Track",
                subtitle: "Focus what matters most",
                tasks: [RoutineTask(images: ["routine1", "routine2", "routine3"],
                                     description: "Drink a glass of water",
                                     subDescription: "start with full glass of water to day",
                                     category: "hydriation, health")]),
        Routine(image: "routine3",
                title: "Evening Wind-Down Routine Steps",
                subtitle: "Evening step are so important",
                tasks: [RoutineTask(images: ["routine1", "routine2", "routine3"],
                                     description: "Drink a glass of water",
                                     subDescription: "start with full glass of water to day",
                                     category: "hydriation, health")]),
        Routine(image: "routine4",
                title: "Comprehensive Sleep Routine Goals",
                subtitle: "Sleeping is so important for us",
                tasks: [RoutineTask(images: ["routine1", "routine2", "routine3"],
                                     description: "Drink a glass of water",
                                     subDescription: "start with full glass of water to day",
                                     category: "hydriation, health")])
    ]
    
}
