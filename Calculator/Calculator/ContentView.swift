// https://www.youtube.com/watch?v=cMde7jhQlZI
//  ContentView.swift
//  Calculator
//
//  Created by Woody on 2022/05/26.
//

import SwiftUI

struct ContentView: View {
    var buttons: [[CalculationButton]] = [
        [.reset, .sign, .remain, .divide],
        [.seven, .eight, .nine, .multi],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equal]
    ]
    @State var result: Int = 0
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 8) {
                Spacer()
                HStack {
                    Spacer()
                    Text("\(result)")
                        .font(.system(size: 100))
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .padding(.trailing, 30)
                }
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 8) {
                        ForEach(row, id: \.self) { item in
                            item.button
                        }
                    }
                }
            }
        }
    }
}

struct CalculationButtonView: View {
    static var buttonGap: CGFloat = 12
    var item: CalculationButton
    
    var body: some View {
        Button {
            // TODO: 버튼 클릭
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
    
    private func buttonSize(item: CalculationButton) -> CGSize {
        var width: CGFloat = (UIScreen.screenWidth - CalculationButtonView.buttonGap * 5) / 4
        let height: CGFloat = width
        if item == .zero { width = width * 2 + CalculationButtonView.buttonGap }
        return CGSize(width: width, height: height)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
