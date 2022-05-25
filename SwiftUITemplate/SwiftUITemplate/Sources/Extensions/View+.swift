//
//  View+.swift
//  SwiftUITemplate
//
//  Created by Woody on 2022/05/25.
//

import SwiftUI

extension View {
    
    /// 배경색 설정
    ///
    /// color : 배경색
    func backgroundOverlay(color: Color) -> some View {
        ZStack {
            color.ignoresSafeArea(.all)
            self
        }
    }
}
