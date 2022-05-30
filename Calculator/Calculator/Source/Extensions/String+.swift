//
//  String+.swift
//  Calculator
//
//  Created by Woody on 2022/05/30.
//

import Foundation

extension String {
    
    // ✅ 쉼표 생성은 링크 참고함
    // http://yoonbumtae.com/?p=3394
    func createRestIfNeeded() -> Self {
        guard self.filter({ $0 == "." }).isEmpty else { return self }
        
        let number: Int = Int(self) ?? 0
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: number))!
    }

    func removeLastPointZero() -> Self {
        guard self.count >= 2 else { return self }
        
        let secondToLastIndex: Index    = self.index(before: self.index(before: self.endIndex))
        let secondToLast: String        = String(self.suffix(from: secondToLastIndex))
        
        return secondToLast == ".0" ? String(self.dropLast(2)) : self
    }
}
