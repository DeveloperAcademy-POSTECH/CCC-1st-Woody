//
//  ImageButton.swift
//  Calculator
//
//  Created by Woody on 2022/06/02.
//

import SwiftUI

struct ImageButton: View {
    var item: CalculationButton
    var action: (() -> Void)
    var body: some View {
        Button(action: action) {
            item.image
                .font(.system(size: 32))
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
    
}
