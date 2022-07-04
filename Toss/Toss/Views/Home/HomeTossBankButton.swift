//
//  HomeTossBankButton.swift
//  Toss
//
//  Created by Woody on 2022/07/05.
//

import SwiftUI

struct HomeTossBankButton: View {
    var body: some View {
        Button {
            print("Tapp 토스뱅크")
        } label: {
            
            HStack {
                Text("토스뱅크")
                    .foregroundColor(Pallete.black.color)
                    .font(.system(size: 22, weight: .bold, design: .monospaced))
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Pallete.basicGray.color)
            }
            .padding(20)
            .background(Pallete.white.color)
            .cornerRadius(25)
        }

    }
}

struct HomeTossBankButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeTossBankButton()
    }
}
