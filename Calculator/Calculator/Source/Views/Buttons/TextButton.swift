//
//  TextButton.swift
//  Calculator
//
//  Created by Woody on 2022/06/02.
//

import SwiftUI

struct TextButton: View {
    var item: CalculationButton
    var action: (() -> Void)
    var body: some View {
        Button(action: action) {
            judgeTextOrImage()
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
    
    private func judgeTextOrImage() -> some View {
        if let image = item.image {
            return Text(image)
        }
        return Text(item.rawValue)
    }
}
