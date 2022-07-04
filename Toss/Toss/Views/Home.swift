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
            VStack {
                HomeHeader()
                Spacer()
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
