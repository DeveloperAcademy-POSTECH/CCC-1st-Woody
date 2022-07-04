//
//  Tab.swift
//  Toss
//
//  Created by Woody on 2022/07/03.
//

import SwiftUI

enum Tab: CaseIterable {
    case home
    case benefit
    case remittance
    case stock
    case whole
    
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .benefit:
            return "혜택"
        case .remittance:
            return "송금"
        case .stock:
            return "주식"
        case .whole:
            return "전체"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .home:
            return "house.fill"
        case .benefit:
            return "diamond.fill"
        case .remittance:
            return "dollarsign.circle"
        case .stock:
            return "waveform.path.ecg"
        case .whole:
            return "text.justify"
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .home:
            Home()
        case .benefit:
            Benefit()
        case .remittance:
            Remittance()
        case .stock:
            Stock()
        case .whole:
            Whole()
        }
    }
}
