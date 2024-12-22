//
//  RoutinesDetailView.swift
//  RoutineApp
//
//  Created by Ahmet Utlu on 22.12.2024.
//

import SwiftUI

struct RoutinesDetailView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject var viewModel: RoutinesDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 13) {
                HStack(alignment: .center, spacing: 12) {
                    Button {
                        //back action
                        coordinator.pop()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(Color.init(hex: "#8F9098"))
                            .frame(width: 9, height: 16)
                    }
                                   
                    Text(viewModel.routine.title)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color.init(hex: "#0C0F39"))
                        .font(.custom(CustomFonts.karlRegular.rawValue, size: 14))
                    
                    Spacer()
                    
                    Button {
                        viewModel.toggleSelectAll()
                    } label: {
                        Text(viewModel.isSelectAll ? "Cancel" :"Select all")
                            .foregroundStyle(viewModel.isSelectAll ? Color(hex: "#575767") : .white)
                            .font(.custom(CustomFonts.karlRegular.rawValue, size: 14))
                    }
                    .padding(.horizontal, 13)
                    .padding(.vertical, 7)
                    .background(viewModel.isSelectAll ? Color(hex: "#C5C6CC").opacity(0.4) : Color.init(hex: "#0C8CE9"))
                    .clipShape(.capsule)
                }//: Navbar
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(Color.init(hex: "#D0D0D0"))
                
            }
            .padding(.horizontal, 20)
                        
            List {
                VStack(alignment: .leading, spacing: 13) {
                    Text("Wake-Up and Hydration")
                        .foregroundStyle(Color.init(hex: "#000000"))
                        .font(.custom(CustomFonts.cardoRegular.rawValue, size: 28))
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(Color.init(hex: "#D0D0D0"))
                    
                }//: List header view
                
                ForEach(viewModel.routine.tasks.indices, id: \.self) { index in
                    RoutinesDetailListRow(rutineTask: viewModel.routine.tasks[index],
                                          viewModel: viewModel)
                    
                    .listRowSeparator(.hidden)
                }//: List Body
            }//: List
            .listStyle(PlainListStyle())
            .scrollContentBackground(.hidden)
        }//: MainVstack
        .overlay(alignment: .bottomTrailing) {
            if !viewModel.selectedTasks.isEmpty {
                Button {
                    coordinator.presentSheet(.addToList(routineTasks: viewModel.selectedTasks))
                } label: {
                    HStack(alignment: .center, spacing: 10) {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 23, height: 23)
                        
                        Text("Add to list")
                            .foregroundStyle(.white)
                            .font(.custom(CustomFonts.karlRegular.rawValue, size: 14))
                    }
                }
                .padding(.vertical, 18)
                .padding(.horizontal, 20)
                .background(Color.init(hex: "#0C8CE9"))
                .clipShape(.capsule)
                .padding(24)
            }
        }
        .onChange(of: viewModel.selectedTasks) { _, _ in
            viewModel.isSelectAll = viewModel.selectedTasks.count == viewModel.routine.tasks.count
        }
    }
}

#Preview {
    RoutinesDetailView(viewModel: RoutinesDetailViewModel(routine:
                                                            Routine(image: "detail1",
                                                                    title: "Detailed Morning Routine Tasks",
                                                                    subtitle: "Wake-Up and Hydration",
                                                                    tasks: [RoutineTask(images: ["detail1", "detail2", "detail1"],
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
                                                                                        description: "Deep Breathing Exercise",
                                                                                        subDescription: "Practice deep breathing for 5 minutes",
                                                                                        category: "Breathing, Mindfulness, Calm"),
                                                                            RoutineTask(images: nil,
                                                                                        description: "Short Walk or Jog",
                                                                                        subDescription: "Go outside for fresh air and movement",
                                                                                        category: "Outdoor, Movement")
                                                                    ]
                                                                   )
                                                         ))
}
