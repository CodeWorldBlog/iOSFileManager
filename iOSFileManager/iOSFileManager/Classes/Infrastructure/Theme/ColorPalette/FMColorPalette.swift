//
//  ASColorPalette.swift
//  Awakening Stories
//
//  Created by Saurav Nagpal on 26/09/23.
//

import Foundation
import SwiftUI

public class FMColorPalette: Decodable {
    fileprivate(set) var appBackgroundColor: Color
    fileprivate(set) var appTintColor: Color
    fileprivate(set) var navBackgroundColour: Color
    fileprivate(set) var borderColor: Color
    
    private enum CodingKeys: String, CodingKey {
        case appBackgroundColor = "appBackgroundColor"
        case navBackgroundColour = "navigationBackgroundColor"
        case borderColor = "borderColor"
        case appTintColor = "appTintColor"
    }
    
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let backgroundColorRaw = try container.decode(String.self, forKey: .appBackgroundColor)
        self.appBackgroundColor = Color(hex: backgroundColorRaw) ?? .gray
        let navBackgroundColorRaw = try container.decode(String.self, forKey: .navBackgroundColour)
        self.navBackgroundColour = Color(hex: navBackgroundColorRaw) ?? .accentColor
        let borderColorRaw = try container.decode(String.self, forKey: .borderColor)
        self.borderColor = Color(hex: borderColorRaw) ?? .gray
        
        let appTintColorRaw = try container.decode(String.self, forKey: .appTintColor)
        self.appTintColor = Color(hex: appTintColorRaw) ?? .cyan
    }
}
