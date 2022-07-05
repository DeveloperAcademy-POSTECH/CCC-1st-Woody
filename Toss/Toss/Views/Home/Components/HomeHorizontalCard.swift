//
//  HomeHorizontalCard.swift
//  Toss
//
//  Created by Woody on 2022/07/05.
//

import SwiftUI

struct HomeHorizontalCard: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                HomeRectangle(subTitle: "운전하면", title: "내 차 시세\n조회")
                HomeRectangle(subTitle: "운전하면", title: "내 차 시세\n조회")
                HomeRectangle(subTitle: "운전하면", title: "내 차 시세\n조회")
                HomeRectangle(subTitle: "운전하면", title: "내 차 시세\n조회")
                HomeRectangle(subTitle: "운전하면", title: "내 차 시세\n조회")
                HomeRectangle(subTitle: "운전하면", title: "내 차 시세\n조회")
            }
        }
        .frame(height: 180)
    }
}

struct HomeHorizontalCard_Previews: PreviewProvider {
    static var previews: some View {
        HomeHorizontalCard()
    }
}
