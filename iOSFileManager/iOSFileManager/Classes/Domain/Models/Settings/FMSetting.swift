//
//  FMSettings.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 30/06/24.
//

import Foundation
import SwiftUI

@dynamicMemberLookup
struct FMSettings {
    /*case fontSize(size: Double)
    case folderIcon(color: Color)
    case fileColor(color: Color)*/
    
    subscript(dynamicMember key: String) -> AnyObject {
        get {
            return UserDefaults.standard.value(forKey: key) as AnyObject
        } set {
            UserDefaults.standard.setValue(newValue, forKey: key)
        }
    }
}
@dynamicMemberLookup
struct ThreeDView {
    public var shadowDepth: Float
    public var angle: Float
    private(set) var _view: LoginView
    
    subscript<T>(dynamicMember keyPath: KeyPath<LoginView, T>) -> T {
        return _view[keyPath: keyPath]
    }
}

struct LoginView: View {
    var username: String
    
    var body: some View {
        Text("User")
    }
}
