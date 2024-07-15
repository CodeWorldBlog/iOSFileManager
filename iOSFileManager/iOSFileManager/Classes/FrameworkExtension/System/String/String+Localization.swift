//
//  String+Localization.swift
//  Awakening Stories
//
//  Created by Saurav Nagpal on 15/02/23.
//

import Foundation

extension String {
    var localizedString: String {
        return NSLocalizedString(self, comment: "")
    }
}
