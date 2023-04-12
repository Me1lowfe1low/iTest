//
//  QuestionType.swift
//  iTest
//
//  Created by Dmitrii Gordienko on 09.04.2023.
//

import Foundation

enum QuestionType: Identifiable, CaseIterable {
    var id: Self { self }
    case string
    case multimedia
    case scaledQuestion
    
    var title: String {
        switch self {
            case .multimedia:
                return "Media question"
            case .scaledQuestion:
                return "Scaled question"
            case .string:
                return "Simple line question"
        }
    }
}
