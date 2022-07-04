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
    case basicGray
    case red
    
    var color: Color {
        return Color(self.rawValue)
    }
}
