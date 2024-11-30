//
//  CardStyle.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 25/10/24.
//

import SwiftUI

struct CardStyle: ViewModifier {
    let fillColor: Color
    
    init(fillColor: Color = .white) {
        self.fillColor = fillColor
    }
    
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(self.fillColor.shadow(.inner(color: .gray.opacity(0.7), radius: 2)))
            content.padding(20)
        }
    }
}

extension View {
    func cardStyle(fillColor: Color) -> some View {
        modifier(CardStyle(fillColor: fillColor))
    }
}
