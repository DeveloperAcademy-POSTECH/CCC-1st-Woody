// https://www.youtube.com/watch?v=cMde7jhQlZI
//  ContentView.swift
//  Calculator
//
//  Created by Woody on 2022/05/26.
//

import SwiftUI

struct ContentView: View {
    private let buttonGap: CGFloat = 12
    private let buttons: [[CalculationButton]] = [
        [.reset, .sign, .percent, .divide],
        [.seven, .eight, .nine, .multi],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equal]
    ]
    @State private var showingNumber: String = "0"
    @State private var operand1: Double? = .none
    @State private var operand2: Double? = .none
    @State private var selectedOperation: Operation = .none
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 8) {
                Spacer()
                HStack {
                    Spacer()
                    Text("\(showingNumber)")
                        .font(.system(size: 90))
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .padding([.leading, .trailing], 30)
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                }
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 8) {
                        ForEach(row, id: \.self) { item in
                            createButton(item)
                        }
                    }
                }
            }
        }
    }
    
    private func createButton(_ item: CalculationButton) -> some View {
        Button {
            pressButton(item: item)
        } label: {
            switch item {
            case .equal, .minus, .plus, .divide, .percent, .multi, .sign:
                item.image
                    .font(.system(size: 32))
                    .frame(
                        width: self.buttonSize(item: item).width,
                        height: self.buttonSize(item: item).height,
                        alignment: .center
                    )
                    .background(item.backgroundColor)
                    .foregroundColor(item.textColor)
                    .cornerRadius(self.buttonSize(item: item).width / 2)
            case .zero:
                HStack {
                    Text(item.rawValue)
                        .font(.system(size: 35))
                        .padding(.leading, 30) // TODO: 30 계산 무지성으로 넣었다............ 고쳐야합니다.
                    Spacer()
                }
                .frame(
                    width: self.buttonSize(item: item).width,
                    height: self.buttonSize(item: item).height,
                    alignment: .center
                )
                .background(item.backgroundColor)
                .foregroundColor(item.textColor)
                .cornerRadius(self.buttonSize(item: item).width / 2)
            default:
                Text(item.rawValue)
                    .font(.system(size: 35))
                    .frame(
                        width: self.buttonSize(item: item).width,
                        height: self.buttonSize(item: item).height,
                        alignment: .center
                    )
                    .background(item.backgroundColor)
                    .foregroundColor(item.textColor)
                    .cornerRadius(self.buttonSize(item: item).width / 2)
            }
        }
    }
}

// MARK: UI
extension ContentView {
    private func buttonSize(item: CalculationButton) -> CGSize {
        var width: CGFloat = (UIScreen.screenWidth - buttonGap * 5) / 4
        let height: CGFloat = width
        if item == .zero { width = width * 2 + buttonGap }
        return CGSize(width: width, height: height)
    }
}

// MARK: Logic
extension ContentView {
    private func pressButton(item: CalculationButton) {
        judgeDotPressed(item: item)
        judgeNumberPressed(item: item)
        judgeSignPressed(item: item)
        judgePercentPressed(item: item)
        judgeACPressed(item: item)
        judgeOperationPressed(item: item)
        judgeEqualPressed(item: item)
    }
    
    private func judgeDotPressed(item: CalculationButton) {
        guard item == .dot else { return }
        
        let item = item.rawValue
        if selectedOperation == .none {
            writeDotCalculation(with: item, to: &operand1)
        } else {
            writeDotCalculation(with: item, to: &operand2)
        }
    }
    
    private func writeDotCalculation(with item: String,
                                     to operand: inout Double?) {
        let newShowingNumber = operand == .none ?  "0\(item)" : "\(showingNumber)\(item)"
        showingNumber = newShowingNumber
        operand = Double(showingNumber.stringToNumber())
    }
    
    private func judgeNumberPressed(item: CalculationButton) {
        guard let item = Int(item.rawValue) else { return }
        
        if selectedOperation == .none {
            writeNumberCalculation(with: item, to: &operand1)
        } else {
            writeNumberCalculation(with: item, to: &operand2)
        }
    }
    
    private func writeNumberCalculation(with item: Int,
                                        to operand: inout Double?) {
        var newOperand1ShowingNumber: String = (operand == .none) || showingNumber == "0" ? "\(item)" : "\(showingNumber)\(item)"
        var newOperand2ShowingNumber: String = (operand == .none) ? "\(item)" : "\(showingNumber)\(item)"
        if showingNumber == "-0" {
            newOperand2ShowingNumber = "-\(item)"
            newOperand1ShowingNumber = "-\(item)"
        }
        showingNumber = (operand == operand1) ? newOperand1ShowingNumber.createRestIfNeeded(newOperand1ShowingNumber) : newOperand2ShowingNumber
        operand = Double(showingNumber.stringToNumber())
    }
    
    private func judgeSignPressed(item: CalculationButton) {
        guard item == .sign else { return }
   
        if selectedOperation == .none {
            operand1 = (0 - (operand1 ?? 0))
        } else {
            operand2 = (0 - (operand2 ?? 0))
        }
        
        if let firstLetter = showingNumber.first, firstLetter == "-" {
            showingNumber = String(showingNumber.dropFirst())
        } else {
            showingNumber = "-" + showingNumber
        }
        
    }
    
    private func judgePercentPressed(item: CalculationButton) {
        guard item == .percent else { return }
        if let number = Double(showingNumber) {
            showingNumber = String(number / 100)
        }
    }
    
    private func judgeACPressed(item: CalculationButton) {
        guard item == .reset else { return }
        showingNumber = "0"
        operand1 = .none
        operand2 = .none
        selectedOperation = .none
    }
    
    private func judgeOperationPressed(item: CalculationButton) {
        let newOperation = item.operation
        selectedOperation = newOperation == .none ? selectedOperation : newOperation
        
        guard item.operation != .none else { return }
        operand1 = Double(showingNumber.stringToNumber())
        operand2 = .none
    }
    
    private func judgeEqualPressed(item: CalculationButton) {
        guard item == .equal else { return }
        
        let operand1: Double = operand1 ?? 0
        let operand2: Double = operand2 ?? 0
        switch selectedOperation {
        case .plus:
            let result = operand1 + operand2
            showingNumber = "\(result)".removeLastPointZero()
        case .minus:
            let result = operand1 - operand2
            showingNumber = "\(result)".removeLastPointZero()
        case .multiply:
            let result = operand1 * operand2
            showingNumber = "\(result)".removeLastPointZero()
        case .divide:
            let result = operand1 / operand2
            showingNumber = "\(result)".removeLastPointZero()
        case .none:
            break
        }
        showingNumber = showingNumber.createRestIfNeeded(showingNumber)
        self.operand1 = .none
        self.operand2 = .none
        selectedOperation = .none
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
