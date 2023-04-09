//
//  SideMenu.swift
//  iTest
//
//  Created by Dmitrii Gordienko on 08.04.2023.
//

import SwiftUI

struct SideMenu: View {
    @State var answerOptions: AnswersAlignmentDTO = AnswersAlignmentDTO()
    @State var questionType: QuestionType = .string
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Configuration")
                .font(.largeTitle)
                .bold()
                .fixedSize()
                .padding([.top], 80)
                .padding([.horizontal, .bottom])
            Section("Question content") {
                ZStack {
                    Rectangle()
                        .stroke(lineWidth: 1.0)
                        .frame(width: .infinity, height: 50)
                    Picker("", selection: $questionType)
                    {
                        ForEach(QuestionType.allCases)  {
                            type in
                            Text(type.title)
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            .modifier(SectionViewModifier())
            Section("Layout") {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                    ForEach(LayoutModel.allCases) { layout in
                        Image(systemName: layout.icon)
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                
                }
            }
            .modifier(SectionViewModifier())
            Section("Answers alignment"){
                Divider()
                ForEach(AnswerModel.allCases) { answerOption in
                    AnswersOptions(answer: answerOption, option: $answerOptions)
                }
                Divider()
                Spacer()
            }
            .modifier(SectionViewModifier())
            
        
        }
        .background(Color(UIColor.secondarySystemBackground))
        .ignoresSafeArea(edges: .top)
        .frame(width: 250, height: .infinity)
    }
        
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}



