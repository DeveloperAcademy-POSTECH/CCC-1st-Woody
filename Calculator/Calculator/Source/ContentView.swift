// https://www.youtube.com/watch?v=cMde7jhQlZI
//  ContentView.swift
//  Calculator
//
//  Created by Woody on 2022/05/26.
//

import SwiftUI

struct ContentView: View {
    private let buttonGap: CGFloat = 12
    private let maxCharacterLength: Int = Int(9)
    private let buttons: [[CalculationButton]] = [
        [.reset, .sign, .remain, .divide],
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
                    Text("\(showingNumber.createRestIfNeeded())")
                        .font(.system(size: 90))
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .padding(.trailing, 30)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
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
//        .onReceive(managershowingNumber) { _ in
//            if maxCharacterLength < text.count {
//                text = String(text.prefix(maxCharacterLength))
//            }
//        }
    }
    
    private func createButton(_ item: CalculationButton) -> some View {
        Button {
            pressButton(item: item)
        } label: {
            Text(item.rawValue)
                .font(.system(size: 38))
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
        judgeACPressed(item: item)
        judgeOperationPressed(item: item)
        judgeEqualPressed(item: item)
    }
    
    private func judgeDotPressed(item: CalculationButton) {
        if item == .dot {
            let item = item.rawValue
            if selectedOperation == .none {
                writeDotCalculation(with: item, to: &operand1)
            } else {
                writeDotCalculation(with: item, to: &operand2)
            }
        }
    }
    
    private func writeDotCalculation(with item: String,
                                     to operand: inout Double?) {
        let newShowingNumber = operand == .none ?  "0\(item)" : "\(showingNumber)\(item)"
        showingNumber = newShowingNumber
        operand = Double(showingNumber)
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
        let newOperand1ShowingNumber: String = (operand == .none) ? "\(item)" : "\(showingNumber)\(item)"
        let newOperand2ShowingNumber: String = (operand != .none) ? "\(showingNumber)\(item)" : "\(item)"
        
        showingNumber = operand == operand1 ? newOperand1ShowingNumber : newOperand2ShowingNumber
        operand = Double(showingNumber)
    }
    
    private func judgeACPressed(item: CalculationButton) {
        if item == .reset {
            showingNumber = "0"
            operand1 = .none
            operand2 = .none
            selectedOperation = .none
        }
    }
    
    private func judgeOperationPressed(item: CalculationButton) {
        if item.operation != .none {
            operand1 = Double(showingNumber)
            operand2 = .none
        }
        let newOperation = item.operation
        selectedOperation = newOperation == .none ? selectedOperation : newOperation
    }
    
    private func judgeEqualPressed(item: CalculationButton) {
        if item == .equal {
            let operand1: Double = operand1 ?? 0
            let operand2: Double = operand2 ?? 0
            print(operand1, operand2)
            switch selectedOperation {
            case .plus:
                showingNumber = "\(operand1 + operand2)".removeLastPointZero()
            case .minus:
                showingNumber = "\(operand1 - operand2)".removeLastPointZero()
            case .multiply:
                showingNumber = "\(operand1 * operand2)".removeLastPointZero()
            case .divide:
                showingNumber = "\(operand1 / operand2)".removeLastPointZero()
            case .remain:
                showingNumber = "\(operand1.truncatingRemainder(dividingBy: operand2))".removeLastPointZero()
            case .none:
                break
            }
            self.operand1 = .none
            self.operand2 = .none
            selectedOperation = .none
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
