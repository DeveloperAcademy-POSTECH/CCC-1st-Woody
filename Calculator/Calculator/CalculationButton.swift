//
//  CalculationButton.swift
//  Calculator
//
//  Created by Woody on 2022/05/27.
//

import SwiftUI

enum CalculationButton: String {
    case dot    = "."
    case zero   = "0"
    case one    = "1"
    case two    = "2"
    case three  = "3"
    case four   = "4"
    case five   = "5"
    case six    = "6"
    case seven  = "7"
    case eight  = "8"
    case nine   = "9"
    case reset  = "AC"
    case sign   = "+/-"
    case divide = "/"
    case remain = "%"
    case multi  = "X"
    case minus  = "-"
    case plus   = "+"
    case equal  = "="
    
    var backgroundColor: Color {
        switch self {
        case .reset, .sign, .remain:
            return Palette.lightGray
        case .equal, .plus, .minus, .multi, .divide:
            return Palette.orange
        default:
            return Palette.darkGray
        }
    }
    
    var textColor: Color {
        switch self {
        case .reset, .sign, .remain:
            return .black
        default:
            return .white
        }
    }
    
    @ViewBuilder
    var button: some View {
        CalculationButtonView(item: self)
    }
    
}
