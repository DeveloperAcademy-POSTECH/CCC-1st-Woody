//
//  HomeAssets.swift
//  Toss
//
//  Created by Woody on 2022/07/05.
//

import SwiftUI

struct HomeAssets: View {
    var radius: CGFloat
    
    init(radius: CGFloat = 0) {
        self.radius = radius
    }
    var body: some View {
        Button {
            print("Tapp 토스뱅크")
        } label: {
            
            HStack(spacing: 16) {
                Image("toss_logo")
                    .resizable()
                    .frame(width: 42, height: 42, alignment: .center)
                    .cornerRadius(21)
                    .font(.system(size: 22, weight: .bold, design: .monospaced))
                VStack(alignment: .leading, spacing: 6) {
                    Text("토스뱅크 통장")
                        .foregroundColor(Pallete.subGray.color)
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                    Text("436,089 원")
                        .foregroundColor(Pallete.black.color)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                }

                Spacer()
                Button {
                    print("송금")
                } label: {
                    Text("송금")
                        .foregroundColor(Pallete.subGray2.color)
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .padding([.leading, .trailing], 16)
                        .padding([.top, .bottom], 10)
                        .background(Pallete.backgroundGray.color)
                        .cornerRadius(6)
                }

            }
            .padding(20)
            .background(Pallete.white.color)
            .cornerRadius(radius, corners: .bottomLeft)
            .cornerRadius(radius, corners: .bottomRight)
        }

    }
}

struct HomeAssets_Previews: PreviewProvider {
    static var previews: some View {
        HomeAssets()
    }
}
