//
//  SideMenu.swift
//  iTest
//
//  Created by Dmitrii Gordienko on 08.04.2023.
//

import SwiftUI

struct SideMenu: View {
    @State var answerOptions: Bool = false
    
    var body: some View {
        VStack {
            Text("Configuration")
                .font(.largeTitle)
                .bold()
                .fixedSize()
                .padding([.top], 80)
                .padding([.horizontal, .bottom])
            Section("Question content") {
                
            }
            Section("Layout") {
                
            }
            Section("Answers alignment"){
                Divider()
                AnswersOptions(title: "One answer", checked: $answerOptions)
                AnswersOptions(title: "Multiple answers", checked: $answerOptions)
                AnswersOptions(title: "Custom answer", checked: $answerOptions)
                Divider()
                Spacer()
            }
        }
        .background(Color(UIColor.secondarySystemBackground))
        .ignoresSafeArea(edges: .top)
        .frame(width: 250, height: .infinity)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}
