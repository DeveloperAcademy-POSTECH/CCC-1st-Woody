//
//  BottomView.swift
//  Toss
//
//  Created by Woody on 2022/07/04.
//

import SwiftUI

struct BottomView: View {
    
    var height: CGFloat = 90
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            Spacer()
            ForEach(Tab.allCases, id: \.self) { tab in
                Button {
                    self.selectedTab = tab
                } label: {
                    TabBarItem(item: tab,
                               isSelected: selectedTab == tab)
                }
                Spacer()
            }
        }
        .frame(height: height)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 0.5)
        )
        .ignoresSafeArea()
        
    }
    
}

struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomView(selectedTab: .constant(.home))
    }
}
