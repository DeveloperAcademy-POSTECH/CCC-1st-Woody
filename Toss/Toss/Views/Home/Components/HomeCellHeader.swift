//
//  HomeTossBankButton.swift
//  Toss
//
//  Created by Woody on 2022/07/05.
//

import SwiftUI

struct HomeCellHeader: View {
    var radius: [CGFloat]
    var title: String
    var isRight: Bool
    init(_ radius: [CGFloat], title: String, isRight: Bool = true) {
        self.radius = radius
        self.title = title
        self.isRight = isRight
    }
    var body: some View {
        Button {
            print("Tap 토스뱅크")
        } label: {
            
            HStack {
                Text(title)
                    .foregroundColor(Pallete.black.color)
                    .font(.system(size: 22, weight: .bold, design: .monospaced))
                Spacer()
                if isRight {
                    Image(systemName: "chevron.right")
                        .foregroundColor(Pallete.basicGray.color)
                }
            }
            .padding(20)
            .background(Pallete.white.color)
            .cornerRadius(radius[0], corners: .topLeft)
            .cornerRadius(radius[1], corners: .topRight)
            .cornerRadius(radius[2], corners: .bottomRight)
            .cornerRadius(radius[3], corners: .bottomLeft)
        }

    }
}

struct HomeCellHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeCellHeader([25, 25, 25, 25], title: "토스뱅크")
    }
}
