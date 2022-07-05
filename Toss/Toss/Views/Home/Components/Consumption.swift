//
//  Consumption.swift
//  Toss
//
//  Created by Woody on 2022/07/05.
//

import SwiftUI

struct Consumption: View {
    var radius: CGFloat
    
    init(radius: CGFloat = 0) {
        self.radius = radius
    }
    var body: some View {
        Button {
            print("Tapp 토스뱅크")
        } label: {
            
            HStack(spacing: 16) {
                image()
                text()
                Spacer()
                button()
            }
            .padding(20)
            .background(Pallete.white.color)
            .cornerRadius(radius, corners: .bottomLeft)
            .cornerRadius(radius, corners: .bottomRight)
        }
    }
    
    @ViewBuilder
    private func image() -> some View {
        Image("card")
            .resizable()
            .frame(width: 42, height: 42, alignment: .center)
    }
    
    @ViewBuilder
    private func text() -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("이번달 쓴 금액")
                .foregroundColor(Pallete.subGray.color)
                .font(.system(size: 14, weight: .medium, design: .rounded))
            Text("1,436,413 원")
                .foregroundColor(Pallete.black.color)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
        }
    }
    
    @ViewBuilder
    private func button() -> some View {
        Button {
            print("송금")
        } label: {
            Text("새 내역 10건+")
                .foregroundColor(.blue)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .padding([.leading, .trailing], 10)
                .padding([.top, .bottom], 8)
                .background(.blue.opacity(0.1))
                .cornerRadius(6)
        }
    }
}

struct Consumption_Previews: PreviewProvider {
    static var previews: some View {
        Consumption()
    }
}
