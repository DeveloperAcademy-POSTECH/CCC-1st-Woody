//
//  Home.swift
//  Toss
//
//  Created by Woody on 2022/07/03.
//

import SwiftUI

struct Home: View {
    let cellRadius: CGFloat = 25

    var body: some View {
        ZStack {

            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 0) {

                    Color.clear.frame(height: 60 + 12)
                    
                    HomeCellHeader([25, 25, 25, 25], title: "토스뱅크")
                    
                    Color.clear.frame(height: 12)
                    
                    HomeCellHeader([25, 25, 0, 0], title: "자산")

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
                    HStack(spacing: 24) {
                        Text("금액 숨기")
                            .font(.system(size: 17, weight: .bold, design: .rounded))
                            .foregroundColor(Pallete.basicGray.color)
                        Pallete.basicGray.color
                            .frame(width: 1, height: 15)
                        Text("자산 추가")
                            .font(.system(size: 17, weight: .bold, design: .rounded))
                            .foregroundColor(Pallete.basicGray.color)
                        
                    }
                    .padding(40)
                }
                .padding([.leading, .trailing], 16)
                
            }
            .background(Pallete.backgroundGray.color)
            
            homeHeader()
        }
    }
    
    @ViewBuilder
    private func homeHeader() -> some View {
        VStack {
            HomeHeader()
                .background(.ultraThinMaterial)
            Spacer()
        }
//        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
