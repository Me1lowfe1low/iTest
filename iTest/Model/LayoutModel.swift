//
//  LayoutModel.swift
//  iTest
//
//  Created by Dmitrii Gordienko on 10.04.2023.
//

import Foundation

enum LayoutModel: Identifiable, CaseIterable {
    var id: Self { self }
    case grid
    case list
    
    var title: String {
        switch self {
            case .grid:
                return "Grid"
            case .list:
                return "List"
        }
    }
}
