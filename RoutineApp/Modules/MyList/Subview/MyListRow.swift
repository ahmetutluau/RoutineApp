//
//  MyListRow.swift
//  RoutineApp
//
//  Created by Ahmet Utlu on 22.12.2024.
//

import SwiftUI

struct MyListRow: View {
    var myList: MyList
    
    var body: some View {
        HStack(spacing: 16) {
            Image(myList.image)
                .frame(width: 55, height: 55, alignment: .center)
                .background(Color(hex: "#0C8CE9").opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .foregroundStyle(Color.init(hex: "#0C8CE9"))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(myList.title)
                    .textCase(.uppercase)
                    .foregroundStyle(Color.init(hex: "#000000"))
                    .font(.custom(CustomFonts.karlRegular.rawValue, size: 14))
                
                Text("\(myList.routines.count) items")
                    .foregroundStyle(Color.init(hex: "#575767"))
                    .font(.custom(CustomFonts.cardoRegular.rawValue, size: 12))
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
        }
        .frame(height: 55)
        .frame(maxWidth: .infinity)
    }
}

