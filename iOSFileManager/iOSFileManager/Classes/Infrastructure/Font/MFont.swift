//
//  MFont.swift
//  FileManager
//
//  Created by Saurav Nagpal on 07/01/24.
//

import Foundation
import SwiftUI

struct AppFont {
    static let titleFont: MFont = MFont.ChalkboardBold(size: 16)
    static let paragraphFont: MFont = MFont.Chalkboard(size: 14)
    static let subtitleFont: MFont = MFont.Chalkboard(size: 10)
    
    enum MFont {
        case ChalkboardBold(size: CGFloat)
        case Chalkboard(size: CGFloat)
        
        var family: String {
            switch self {
            case .Chalkboard:
                return "ChalkboardSE-Regular"
            case .ChalkboardBold:
                return "ChalkboardSE-Bold"
            }
        }
        
        var font: Font {
            switch self {
            case .Chalkboard(let size), .ChalkboardBold(size: let size):
                return Font.custom(self.family, size: size)
            }
        }
    }
}
