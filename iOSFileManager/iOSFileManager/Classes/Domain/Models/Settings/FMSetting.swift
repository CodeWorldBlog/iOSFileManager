//
//  FMSettings.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 30/06/24.
//

import Foundation
import SwiftUI

enum FMSetting: OrderedCase {
    case fontSize(size: Double)
    case folderIcon(color: Color)
    case fileColor(color: Color)
    
    var allOrderedCase: [any OrderedCase] {
        return [FMSetting.fontSize(size: 14), FMSetting.folderIcon(color: .yellow), FMSetting.fileColor(color: .gray)]
    }
}
