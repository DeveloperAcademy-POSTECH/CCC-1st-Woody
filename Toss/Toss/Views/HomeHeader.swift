//
//  HomeHeader.swift
//  Toss
//
//  Created by Woody on 2022/07/04.
//

import SwiftUI

struct HomeHeader: View {
    
    var body: some View {
        HStack {
            Text("toss")
                .foregroundColor(Pallete.basicGray.color)
                .font(.system(size: 30, weight: .bold, design: .rounded))
            Spacer()
            HStack(alignment: .center, spacing: 24) {
                Button {
                    print("Tap Message")
                } label: {
                    Image(systemName: "message.fill")
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .center)
                        
                }

                Button {
                    print("Tap Alarm")
                } label: {
                    Image(systemName: "bell.fill")
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .center)
                }
            }
            .foregroundColor(Pallete.basicGray.color)
        }
        .padding(10)
    }
}

struct HomeHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeader()
    }
}
