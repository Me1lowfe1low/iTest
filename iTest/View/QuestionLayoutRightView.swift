//
//  QuestionLayoutRightView.swift
//  iTest
//
//  Created by Дмитрий Гордиенко on 10.04.2023.
//

import SwiftUI

struct QuestionLayoutRightView: View {
    var body: some View {
        //GeometryReader { proxy in
            HStack {
                Spacer()
                VStack {
                    Text("Quesion")
                    Text("Description")
                    LazyVGrid(columns: GridItem())
                    {
                        Button("Add question") {
                            print("Question added")
                        }
                    }
                }
                RoundedRectangle(cornerRadius: 40)
                    .stroke(lineWidth: 2)
                    .frame(width: UIScreen.main.bounds.size.width/2, height: .infinity)
                    
                //.frame(width: proxy.size.width/2, height: proxy.size.height)
            }
            .padding()
            .background(.yellow)
    }
}

struct QuestionLayoutRightView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionLayoutRightView()
    }
}
