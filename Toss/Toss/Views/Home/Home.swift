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
                Color.clear.frame(height: 12)
                HomeTossBankButton()
        
            }
            .padding([.leading, .trailing], 16)
            .padding(.top, 60)
            .background(Pallete.backgroundGray.color)
                
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
