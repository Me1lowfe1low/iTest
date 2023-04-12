//
//  AnswersAlignmentDTO.swift
//  iTest
//
//  Created by Dmitrii Gordienko on 09.04.2023.
//

import Foundation

struct AnswersAlignmentDTO {
    private var option: AnswerModel = .one
    private(set) var checked: Bool = true
    
    mutating func changeOption(to option: AnswerModel) {
        self.option = option
    }
    
    mutating func toggle(with option: AnswerModel) {
        if isEqual(to: option) {
            self.checked.toggle()
        } else {
            self.checked = true
            changeOption(to: option)
        }
    }
    
    func isEqual(to option: AnswerModel) -> Bool {
        self.option == option
    }
    
    func isChoosen(with option: AnswerModel) -> Bool {
        isEqual(to: option) && checked
    }
}

