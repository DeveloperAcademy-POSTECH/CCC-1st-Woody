//
//  Pallete.swift
//  Toss
//
//  Created by Woody on 2022/07/04.
//

import SwiftUI

enum Pallete: String {
    case tabSelectedColor
    case tabUnelectedColor
    case backgroundGray
    case basicGray
    case red
    case black
    case white
    case subGray
    case subGray2
    
    var color: Color {
        return Color(self.rawValue)
    }
}
