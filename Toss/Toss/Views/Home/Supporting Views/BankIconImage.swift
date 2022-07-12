//
//  BankIconImage.swift
//  Toss
//
//  Created by Woody on 2022/07/12.
//

import SwiftUI

struct BankIconImage: View {
    var imageName: String
    var width: CGFloat

    init(imageName: String, width: CGFloat) {
        self.imageName = imageName
        self.width = width
    }

    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: width, height: width)
            .cornerRadius(width / 2)
    }
}

struct BankIconImage_Previews: PreviewProvider {
    static var previews: some View {
        BankIconImage(imageName: "toss_logo", width: 42)
    }
}
