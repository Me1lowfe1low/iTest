//
//  AnswerModel.swift
//  iTest
//
//  Created by Дмитрий Гордиенко on 09.04.2023.
//

import Foundation

enum AnswerModel: Identifiable, CaseIterable {
    var id: Self { self }
    case one
    case multiple
    case custom
    
    var title: String {
        switch self {
            case .one:
                return "One answer"
            case .multiple:
                return "Multiple answers"
            case .custom:
                return "Custom answer"
        }
    }
    
    
}
