//
//  Coordinator.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 12/06/24.
//

import Foundation
import SwiftUI

protocol Coordinator: ObservableObject {
     var appNavigationState: FMAppNavigationState { get }
}
