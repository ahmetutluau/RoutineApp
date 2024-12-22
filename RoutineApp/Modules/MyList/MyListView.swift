//
//  MyListView.swift
//  RoutineApp
//
//  Created by Ahmet Utlu on 22.12.2024.
//

import SwiftUI

struct MyListView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject var viewModel: MyListViewModel

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack {
                Text("My list")
                    .foregroundStyle(Color.init(hex: "#000000"))
                    .font(.custom(CustomFonts.karlRegular.rawValue, size: 14))
                
                Spacer()
                
                Button {
                    //come back
                    coordinator.dismissSheet()
                } label: {
                    Image("closeButton")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }//: header view
            .padding()
            
            List {
                HStack(spacing: 10) {
                    Image(.addToNewList)
                        .frame(width: 55, height: 55, alignment: .center)
                        .background(Color(hex: "#0C8CE9").opacity(0.05))
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                    
                    Text("ADD TO NEW LIST")
                        .foregroundStyle(Color.init(hex: "#0C8CE9"))
                        .font(.custom(CustomFonts.karlRegular.rawValue, size: 14))
                    
                    Spacer()
                }
                .frame(height: 55)
                .frame(maxWidth:.infinity)
                .onTapGesture {
                    viewModel.addToNewList(title: "New List", image: "star.fill")
                }
                
                ForEach(0..<viewModel.myLists.count, id: \.self) { index in
                    let myList = viewModel.myLists[index]
                    
                    MyListRow(myList: myList)
                        .onTapGesture {
                            viewModel.addRoutinesToList(index: index)
                        }
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            
        }//: MainVstack
    }
}

#Preview {
    MyListView(viewModel: MyListViewModel(routines: [RoutineTask(images: ["wineglass.fill", "square.and.arrow.up.fill", "square.and.arrow.up.fill"],
                                                                 description: "aaaaa",
                                                                 subDescription: "bbbb",
                                                                 category: "cccc"),
                                                     RoutineTask(images: nil,
                                                                         description: "bbbb",
                                                                         subDescription: "cccccc",
                                                                         category: "ddddd"),
                                                     RoutineTask(images: ["wineglass.fill", "square.and.arrow.up.fill", "square.and.arrow.up.fill"],
                                                                         description: "asdsd",
                                                                         subDescription: "dsdsadas",
                                                                         category: "csdcsac"),
                                                             RoutineTask(images: nil,
                                                                                 description: "bbbb",
                                                                                 subDescription: "cccccc",
                                                                                 category: "ddddd")],
                                          manager: MyListManager.shared))}
