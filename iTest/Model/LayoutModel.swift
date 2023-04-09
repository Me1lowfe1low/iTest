//
//  LayoutModel.swift
//  iTest
//
//  Created by Дмитрий Гордиенко on 08.04.2023.
//

import Foundation

enum LayoutModel: Identifiable, CaseIterable {
    var id: Self { self }
    case left
    case right
    case smallLeft
    case smallRight
    case middle
    
    var icon: String {
        switch self {
            case .left:
                return "sidebar.leading"
            case .right:
                return "sidebar.trailing"
            case .smallLeft:
                return "box.truck"
            case .smallRight:
                return "box.truck.badge.clock"
            case .middle:
                return "photo.artframe"
        }
    }
}

