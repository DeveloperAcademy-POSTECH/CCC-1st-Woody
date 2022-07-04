//
//  BottomView.swift
//  Toss
//
//  Created by Woody on 2022/07/04.
//

import SwiftUI

struct BottomView: View {
    
    let leadingTrailingPadding: CGFloat = 35
    let height: CGFloat = 90
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            Spacer().frame(width: leadingTrailingPadding)
            ForEach(Tab.allCases, id: \.self) { tab in
                Button {
                    self.selectedTab = tab
                } label: {
                    TabBarItem(item: tab,
                               isSelected: selectedTab == tab)
                }
                if tab != .whole { Spacer() }
            }
            Spacer().frame(width: leadingTrailingPadding)
        }
        .frame(height: height)
        .background(Color.white)
        
    }
    
}

struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomView(selectedTab: .constant(.home))
    }
}
