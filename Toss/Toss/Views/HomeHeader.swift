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
            HStack(alignment: .center, spacing: 8) {
                Image(systemName: "dollarsign.circle.fill")
                    .resizable()
                    .frame(width: 24, height: 24, alignment: .center)
                Text("toss")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .padding(.bottom, 3)
                // MARK: 아이콘 보정때문에 텍스트와 센터를 일치시키기 위하여 패딩을 주었어요.
                // MARK: 참고 자료 - 이슈 #16
            }
            .foregroundColor(Pallete.basicGray.color)
            
            Spacer()
            
            HStack(alignment: .center, spacing: 24) {
                Button {
                    print("Tap Message")
                } label: {
                    Image(systemName: "message.fill")
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .center)
                        
                }

                ZStack {
                    Button {
                        print("Tap Alarm")
                    } label: {
                        Image(systemName: "bell.fill")
                            .resizable()
                            .frame(width: 24, height: 24, alignment: .center)
                    }
                    Pallete.red.color
                        .frame(width: 6, height: 6, alignment: .center)
                        .cornerRadius(3)
                        .offset(x: 12, y: -12)
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
