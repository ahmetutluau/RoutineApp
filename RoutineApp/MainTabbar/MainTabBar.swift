//
//  MainTabBar.swift
//  RoutineApp
//
//  Created by Ahmet Utlu on 22.12.2024.
//

import SwiftUI

enum TabbbarItems: Int, CaseIterable {
    case home
    case checkList
    case profile
    
    var iconName: String {
        switch self {
        case .home: return "home"
        case .checkList: return "checkList"
        case .profile: return "profile"
        }
    }
}

struct MainTabBarView: View {
    @State var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView(viewModel: HomeViewModel())
                    .tag(0)
                
                CheckListView()
                    .tag(1)
                
                ProfileView()
                    .tag(2)
            }
            
            ZStack {
                HStack {
                    ForEach(TabbbarItems.allCases, id: \.self) { tabbbarItem in
                        Button {
                            selectedTab = tabbbarItem.rawValue
                        } label: {
                            CustomTabItem(imageName: tabbbarItem.iconName, isActive: selectedTab == tabbbarItem.rawValue)
                        }

                    }
                }
                .padding(20)
            }
            .frame(height: 64)
            .background(Color(red: 12/255, green: 140/255, blue: 233/255, opacity: 0.3))
            .clipShape(RoundedRectangle(cornerRadius: 32))
            .padding()
        }
    }
}

extension MainTabBarView {
    func CustomTabItem(imageName: String, isActive: Bool) -> some View {
        HStack(spacing: 20) {
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(.white)
                .frame(width: 25, height: 25)
        }
        .frame(width: 50, height: 50)
        .background(isActive ? .blue : .clear)
        .clipShape(Circle())
    }
}
