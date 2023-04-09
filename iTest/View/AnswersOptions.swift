//
//  AnswersOptions.swift
//  iTest
//
//  Created by Dmitrii Gordienko on 08.04.2023.
//

import SwiftUI

struct AnswersOptions: View {
    @State var answer: AnswerModel
    @Binding var option: AnswersAlignmentDTO
    
    var body: some View {
        HStack {
            Text(answer.title)
                .font(.title3)
            Spacer()
            Button(action: {
                option.toggle(with: answer)
                
            })
            {
                Image(systemName: option.isChoosen(with: answer) ? "xmark.app" : "square")
            }
        }
        .padding(.horizontal)
    }
}

struct AnswersOptions_Previews: PreviewProvider {
    static var previews: some View {
        AnswersOptions(answer: AnswerModel.multiple, option: .constant(AnswersAlignmentDTO()))
    }
}
