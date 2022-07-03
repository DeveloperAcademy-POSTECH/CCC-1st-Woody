//
//  ContentView.swift
//  Toss
//
//  Created by Woody on 2022/07/03.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: Tab
    
    var body: some View {
        TabView {
            ForEach(Tab.allCases, id: \.self) { tab in
                tab.view
                    .tabItem {
                        Label(tab.title, systemImage: tab.systemImageName)
                    }
            }
        }
        .accentColor(.black)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedTab: .home)
    }
}
