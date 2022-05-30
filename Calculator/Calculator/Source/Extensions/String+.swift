//
//  String+.swift
//  Calculator
//
//  Created by Woody on 2022/05/30.
//

import Foundation

extension String {
    func removeLastPointZero() -> Self {
        let change: String = self.replacingOccurrences(of: ".0", with: "")
        return change
    }
}
