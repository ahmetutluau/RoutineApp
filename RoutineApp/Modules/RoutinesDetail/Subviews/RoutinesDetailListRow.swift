//
//  RoutinesDetailListRow.swift
//  RoutineApp
//
//  Created by Ahmet Utlu on 22.12.2024.
//

import SwiftUI

struct RoutinesDetailListRow: View {
    var rutineTask: RoutineTask
    @State private var currentIndex: Int = 0
    @ObservedObject var viewModel: RoutinesDetailViewModel
    
    var body: some View {
        VStack {
            if let images = rutineTask.images {
                TabView(selection: $currentIndex) {
                    ForEach(images.indices, id: \.self) { index in
                        Image(images[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width, height: 237)
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 237)
                .overlay(alignment: .bottomLeading) {
                    HStack {
                        ForEach(images.indices, id: \.self) { index in
                            Circle()
                                .fill(index == currentIndex ? Color.init(hex: "#0C8CE9") : Color.init(hex: "#FFFFFF"))
                                .frame(width: 8, height: 8)
                        }
                    }
                    .padding(20)
                }
            }

            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(rutineTask.description)
                        .foregroundStyle(Color.init(hex: "#0C0F39"))
                        .font(.custom(CustomFonts.cardoRegular.rawValue, size: 18))
                    
                    if let subDescription = rutineTask.subDescription {
                        Text(subDescription)
                            .foregroundStyle(Color.init(hex: "#575767"))
                            .font(.custom(CustomFonts.cardoItalic.rawValue, size: 14))
                    }
                    
                    if let categories = rutineTask.category {
                        Text(categories)
                            .foregroundStyle(Color.init(hex: "#0C8CE9"))
                            .font(.custom(CustomFonts.cardoRegular.rawValue, size: 14))
                    }
                }
                
                Spacer()
                
                Button {
                    //used ontapgesture insted of here
                } label: {
                    Image(viewModel.isTaskSelected(rutineTask) ? "added" : "clickToAdd")
                        .resizable()
                        .frame(width: 38, height: 38)
                }
                .frame(width: 38, height: 38)
                .onTapGesture {
                    viewModel.toggleTaskSelection(task: rutineTask)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 18)
            
        }//: MainVstack
        .frame(maxWidth: .infinity)
        .background {
            Color.init(hex: "#FFFCFC")
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2)
        RoutinesDetailListRow(rutineTask: RoutineTask(images: ["detail1",
                                                       "detail2",
                                                       "detail1"],
                                              description: "Drink a Glass of Water",
                                              subDescription: "Start with a full glass to rehydrate after sleep",
                                              category: "Hydration, Health"),
                              viewModel: RoutinesDetailViewModel(routine:
                                                    Routine(image: "routine1",
                                                            title: "Detailed Morning Routine Tasks",
                                                            subtitle: "Wake-Up and Hydration",
                                                            tasks: [RoutineTask(
                                                                images: ["detail1", "detail2", "detail1"],
                                                                                                                                     description: "Drink a Glass of Water",
                                                                                                                                     subDescription: "Start with a full glass to rehydrate after sleep",
                                                                                                                                     category: "Hydration, Health")]
                                                           ))
        )
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 237)
    }
    .ignoresSafeArea()
}
