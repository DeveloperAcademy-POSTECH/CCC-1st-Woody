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
    case sign   = "􀅺"
    case divide = "􀅿"
    case percent = "􀘾"
    case multi  = "􀅾"
    case minus  = "􀅽"
    case plus   = "􀅼"
    case equal  = "􀆀"
}

extension CalculationButton {
    var image: Image {
        switch self {
        case .sign:
            return .init(systemName: "plus.forwardslash.minus")
        case .divide:
            return .init(systemName: "divide")
        case .percent:
            return .init(systemName: "percent")
        case .multi:
            return .init(systemName: "multiply")
        case .minus:
            return .init(systemName: "minus")
        case .plus:
            return .init(systemName: "plus")
        case .equal:
            return .init(systemName: "equal")
        default:
            return .init(systemName: "")
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .reset, .sign, .percent:
            return Palette.lightGray
        case .equal, .plus, .minus, .multi, .divide:
            return Palette.orange
        default:
            return Palette.darkGray
        }
    }
    
    var textColor: Color {
        switch self {
        case .reset, .sign, .percent:
            return .black
        default:
            return .white
        }
    }
    
    var operation: Operation {
        switch self {
        case .plus:
            return .plus
        case .minus:
            return .minus
        case .multi:
            return .multiply
        case .divide:
            return  .divide
        default:
            return .none
        }
    }
}