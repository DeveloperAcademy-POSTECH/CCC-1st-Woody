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
            print("Tap 토스뱅크")
        } label: {
            HStack(spacing: 16) {
                BankIconImage(imageName: "toss_logo", width: 42)

                bankText()

                Spacer()

                SendButton(sendAction: <#T##() -> Void#>)
            }
            .padding(16)
        }
        .buttonStyle(TossButtonStyle())
        .cornerRadius(radius, corners: .bottomLeft)
        .cornerRadius(radius, corners: .bottomRight)
    }

    @ViewBuilder
    private func bankText() -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("토스뱅크 통장")
                .foregroundColor(Pallete.subGray.color)
                .font(.system(size: 12, weight: .medium, design: .rounded))
            Text("436,089 원")
                .foregroundColor(Pallete.black.color)
                .font(.system(size: 17, weight: .semibold, design: .rounded))
        }
    }

    private func send
}

struct HomeAssets_Previews: PreviewProvider {
    static var previews: some View {
        HomeAssets()
    }
}

extension View {

}
