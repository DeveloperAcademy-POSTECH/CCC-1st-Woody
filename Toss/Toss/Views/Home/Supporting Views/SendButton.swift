//
//  SendButton.swift
//  Toss
//
//  Created by Woody on 2022/07/12.
//

import SwiftUI

struct SendButton: View {
    var sendAction: () -> Void
    var body: some View {
        Button(action: sendAction) {
            Text("송금")
                .foregroundColor(Pallete.subGray2.color)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .padding([.leading, .trailing], 16)
                .padding([.top, .bottom], 10)
                .background(Pallete.backgroundGray.color)
                .cornerRadius(6)
        }
    }
}

struct SendButton_Previews: PreviewProvider {
    static var previews: some View {
        SendButton(sendAction: { })
    }
}
