//
//  Home.swift
//  Toss
//
//  Created by Woody on 2022/07/03.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: true) {
                Color.clear
                    .frame(height: 50)
                Pallete.backgroundGray.color
                    .frame(height: 1000)
            }
            homeHeader()
        }
    }
    
    @ViewBuilder
    private func homeHeader() -> some View {
        VStack {
            HomeHeader()
            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
