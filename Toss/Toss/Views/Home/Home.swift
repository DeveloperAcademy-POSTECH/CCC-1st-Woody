//
//  Home.swift
//  Toss
//
//  Created by Woody on 2022/07/03.
//

import SwiftUI

struct AssetsData {
    let imageName: String
    let name: String
    let money: String
}
struct Home: View {
    let cellRadius: CGFloat = 25
    
    var body: some View {
        ZStack {
            homeHeader()
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 0) {
                    
                    Color.clear.frame(height: 12)
                    
                    HomeCellHeader([25, 25, 25, 25], title: "토스뱅크")
                    
                    Color.clear.frame(height: 12)
                    
                    HomeCellHeader([25, 25, 0, 0], title: "자산")
                    HomeAssets()
                    HomeAssets()
                    HomeAssets()
                    HomeAssets()
                    HomeAssets(radius: 25)
                     
                    Color.clear.frame(height: 12)
                }
                .padding([.leading, .trailing], 16)
                VStack(spacing: 0) {
                    HomeCellHeader([25, 25, 0, 0], title: "소비", isRight: false)
                    Consumption(radius: 25)
                    HomeHorizontalCard()
                }
                .padding([.leading, .trailing], 16)
            }
//            .padding(.top, 60)
            .background(Pallete.backgroundGray.color)
             
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
