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
    private var dragGesture: some Gesture {
      DragGesture()
        .onChanged { _ in
          // 드래그 상태가 변경될 때마다 애니메이션과 함께 포지션을 변경시킨다.
          withAnimation(.interactiveSpring()) {
              print("HELLO")
//            positionX = action.location.x
//            positionY = max(action.location.y, 0)
          }
        }
    }

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
                        .padding(.leading, 30)
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
