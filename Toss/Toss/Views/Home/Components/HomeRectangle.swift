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
        VStack(alignment: .trailing, spacing: 10) {
            VStack(alignment: .leading, spacing: 10) {
                Text(subTitle)
                    .foregroundColor(Pallete.subGray.color)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                Text(title)
                    .lineSpacing(6)
                    .lineLimit(2)
                    .foregroundColor(Pallete.black.color)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                
            }
            Image("car")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
        }
        .frame(width: 130, height: 150, alignment: .center)
        .background(Pallete.white.color)
        .cornerRadius(25)
        
    }
}

struct HomeRectangle_Previews: PreviewProvider {
    static var previews: some View {
        HomeRectangle(subTitle: "운전하면", title: "내 차 시세\n조회")
    }
}
