//
//  NavigationState.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 24/06/24.
//

import Foundation

public protocol FMView {
    var identifer: String { get }
}

public enum NavigationType: Equatable {
    case none
    case push(view: FMView)
    case present(view: FMView)
    
    public static func == (lhs: NavigationType, rhs: NavigationType) -> Bool {
        switch(lhs, rhs) {
        case (.push(let view1), .push(let view2)):
            return view1.identifer == view2.identifer
        case (.present(view: let view1), .present(view: let view2)):
            return  view1.identifer == view2.identifer
        default:
            return false
        }
    }
}

public class Navigation: ObservableObject {
    @Published var navigationState = false
    var navigationType: NavigationType
    
    init(navigation: NavigationType) {
        self.navigationType = navigation
    }
}

class FMAppNavigationState {
    private var navigationStack: [Navigation] = []
    
    func isNavigationOn(type: NavigationType) -> Bool {
        guard let navigation = navigationStack.last else {
            return false
        }
        if navigation.navigationType == type {
            return true
        }
       
        return false
    }
    
    func present(navigation: Navigation) {
        navigation.navigationState.toggle()
        self.navigationStack.append(navigation)
    }
    
    func push(navigation: Navigation) {
        navigation.navigationState = true
        self.navigationStack.append(navigation)
    }
    
    @discardableResult func dismiss() -> Bool {
        if case .present(_) = navigationStack.last?.navigationType {
            navigationStack.last?.navigationState = false
            navigationStack.removeLast()
            return true
        }
        return false
    }
    
    @discardableResult func pop() -> Bool {
        if case .push(_) = navigationStack.last?.navigationType {
            navigationStack.last?.navigationState = false
            navigationStack.removeLast()
            return true
        }
        return false
    }
}
