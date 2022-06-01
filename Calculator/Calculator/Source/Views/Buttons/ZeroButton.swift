//
//  ZeroButton.swift
//  Calculator
//
//  Created by Woody on 2022/06/02.
//

import SwiftUI

struct ZeroButton: View {
    var item: CalculationButton
    var action: (() -> Void)
    var body: some View {
        HStack {
            Text(item.rawValue)
                .font(.system(size: 35))
                .padding(.leading, 30)
            // TODO: 30 계산 무지성으로 넣었다............ 고쳐야합니다.
            Spacer()
        }
        .frame(
            width: CalculationView.buttonSize(item: item).width,
            height: CalculationView.buttonSize(item: item).height,
            alignment: .center
        )
        .background(item.backgroundColor)
        .foregroundColor(item.textColor)
        .cornerRadius(CalculationView.buttonSize(item: item).width / 2)
    }
    
}
