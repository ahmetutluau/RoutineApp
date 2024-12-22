//
//  HomeView.swift
//  RoutineApp
//
//  Created by Ahmet Utlu on 22.12.2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Home")
                    .font(Font.custom(CustomFonts.karlRegular.rawValue, size: 25))
                    .foregroundStyle(Color.init(hex: "#1F2024"))
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(Color.init(hex: "#D0D0D0"))
            }//: header view
            .padding(.horizontal, 20)
            
            List {
                ForEach(viewModel.routines, id: \.self) { rutine in
                    HStack(spacing: 16) {
                        Image(rutine.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 92, height: 92, alignment: .center)
                            
                        
                        Text(rutine.title)
                            .font(Font.custom(CustomFonts.karlRegular.rawValue, size: 14))
                            .foregroundStyle(Color.init(hex: "#000000"))
                        
                        Spacer()
                    }//: List row
                    .frame(height: 92)
                    .frame(maxWidth: .infinity)

                    .background {
                        Color.blue.opacity(0.3)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
                        coordinator.push(page: .routineDetail(routine: rutine))
                    }
                    .listRowSeparator(.hidden)
                }
            }//: List
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }//: mainVstack
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
