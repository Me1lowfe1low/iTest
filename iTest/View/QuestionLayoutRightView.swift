//
//  QuestionLayoutRightView.swift
//  iTest
//
//  Created by Dmitrii Gordienko on 10.04.2023.
//

import SwiftUI

struct QuestionLayoutRightView: View {
    var body: some View {
        let answerList: [String] = ["1", "2", "3"]
        
        HStack {
            Spacer()
            VStack {
                Text("Quesion")
                Text("Description")
                LazyVGrid(columns: [GridItem(.flexible())])
                {
                    ForEach(answerList, id: \.self) { answer in
                        Text(answer)
                    }
                    Button("Add answer") {
                        print("Question added")
                    }
                }
            }
            .padding()
            
            Image("imageExample")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(
                    maxWidth: UIScreen.main.bounds.size.width/2,
                    maxHeight: UIScreen.main.bounds.size.height
                )
                .clipped()
                .contentShape(Rectangle())
            
        }
    }
}

struct QuestionLayoutRightView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionLayoutRightView()
    }
}
