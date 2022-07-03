//
//  TabBarItem.swift
//  Toss
//
//  Created by Woody on 2022/07/04.
//

import SwiftUI

struct TabItem {
    let image: String
    let title: String
}

struct TabBarItem: View {
    let item: Tab
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: item.systemImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .tint(isSelected ? .black : .gray)
                .frame(width: 26, height: 26)
                .animation(.default, value: isSelected)
            
            Spacer().frame(height: 4)
            
            Text(item.title)
                .font(.system(size: 12))
                .tint(isSelected ? .black : .gray)
        }
    }
}

struct TabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        TabBarItem(item: .home, isSelected: false)
    }
}
