//
//  Tab.swift
//  Floating Tab Bar
//
//  Created by Aiden Ruiz on 10/19/24.
//

import SwiftUI

enum TabModel: String, CaseIterable {
    case home = "house"
    case search = "magnifyingglass"
    case notifications = "bell"
    case settings = "gearshape"
    
    var title: String {
        switch self {
        case .home : "Home"
        case .search : "Search"
        case .notifications : "Notifications"
        case .settings : "Settings"
        }
    }
}
