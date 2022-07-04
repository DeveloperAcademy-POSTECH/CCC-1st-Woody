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
        CustomTabView(selectedTab: $selectedTab)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedTab: .home)
    }
}
