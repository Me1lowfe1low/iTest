//
//  SortOrder.swift
//  iTest
//
//  Created by Дмитрий Гордиенко on 10.04.2023.
//

import Foundation

enum SortOrder: Identifiable, CaseIterable {
    var id: Self { self }
    case alphabetical
    case lastUpdated
    case dateCreated
    
    var title: String {
        switch self {
            case .alphabetical:
                return "Alphabetical"
            case .lastUpdated:
                return "Last updated"
            case .dateCreated:
                return "Date created"
        }
    }
}
