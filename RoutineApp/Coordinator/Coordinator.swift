//
//  Coordinator.swift
//  RoutineApp
//
//  Created by Ahmet Utlu on 22.12.2024.
//

import SwiftUI

class Coordinator: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    // Customizable detents based on the sheet type
    @Published var sheetDetents: Set<PresentationDetent> = [.large]
        
    func push(page: AppPages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func presentSheet(_ sheet: Sheet) {
        switch sheet {
        case .addToList:
            sheetDetents = [.fraction(0.5), .medium]
        }
        
        self.sheet = sheet
    }
    
    func presentFullSecreenCover(_ cover: FullScreenCover) {
        self.fullScreenCover = cover
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: AppPages) -> some View {
        switch page {
        case .home:
            MainTabBarView()
                .navigationBarBackButtonHidden()
        case .routineDetail(let routine):
            RoutinesDetailView(viewModel: RoutinesDetailViewModel(routine: routine))
                .navigationBarBackButtonHidden()
        }
    }
    
    @ViewBuilder
    func buildSheet(sheet: Sheet) -> some View {
        switch sheet {
        case .addToList:
            EmptyView()
        }
    }
    
    func buildCover(cover: FullScreenCover) -> some View {
        switch cover {
        case .placeHolder:
            EmptyView()
        }
    }
}
