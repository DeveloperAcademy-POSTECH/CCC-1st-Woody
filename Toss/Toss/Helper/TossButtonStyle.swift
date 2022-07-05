//
//  TossButtonStyle.swift
//  Toss
//
//  Created by Woody on 2022/07/05.
//

import SwiftUI

struct TossButtonStyle: ButtonStyle {

  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .foregroundColor(.white)
      .background(configuration.isPressed ? Pallete.white.color.opacity(0.7) : Pallete.white.color)
  }

}
