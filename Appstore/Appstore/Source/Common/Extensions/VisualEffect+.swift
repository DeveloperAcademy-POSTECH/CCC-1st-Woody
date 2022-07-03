// https://www.swiftanytime.com/add-visual-effects-blur-in-swiftui/
//  VisualEffect+.swift
//  Appstore
//
//  Created by Woody on 2022/06/09.
//

import SwiftUI

struct VisualEffect: UIViewRepresentable {
    @State var style: UIBlurEffect.Style 
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
    }
}
