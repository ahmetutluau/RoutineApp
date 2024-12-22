//
//  CoordinatorView.swift
//  RoutineApp
//
//  Created by Ahmet Utlu on 22.12.2024.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .home)
                .navigationDestination(for: AppPages.self) { page in
                    coordinator.build(page: page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.buildSheet(sheet: sheet)
                        .presentationDetents(coordinator.sheetDetents)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { cover in
                    coordinator.buildCover(cover: cover)
                }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
