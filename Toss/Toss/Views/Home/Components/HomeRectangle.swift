//
//  HomeRectangle.swift
//  Toss
//
//  Created by Woody on 2022/07/05.
//

import SwiftUI

struct HomeRectangle: View {
    var subTitle: String
    var title: String
    var body: some View {
        Button {
            
        } label: {
            VStack(alignment: .trailing, spacing: 10) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(subTitle)
                        .foregroundColor(Pallete.subGray.color)
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                    Text(title)
                        .lineSpacing(6)
                        .lineLimit(2)
                        .foregroundColor(Pallete.black.color)
                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                    
                }
                .padding(.top, 8)
                Image("car")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
            }
            .frame(width: 110, height: 130, alignment: .center)
        }
        .buttonStyle(TossButtonStyle())
        .cornerRadius(25)
    }
}

struct HomeRectangle_Previews: PreviewProvider {
    static var previews: some View {
        HomeRectangle(subTitle: "운전하면", title: "내 차 팔기")
    }
}
