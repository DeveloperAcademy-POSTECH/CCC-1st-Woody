//
//  CustomTabView.swift
//  Toss
//
//  Created by Woody on 2022/07/04.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                ForEach(Tab.allCases, id: \.self) {
                    $0.view
                }
            }
            
            VStack {
                Spacer()
                BottomView(selectedTab: $selectedTab)
            }

        }
        .ignoresSafeArea()
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(selectedTab: .constant(.home))
    }
}
