//
//  QuestionLayoutView.swift
//  iTest
//
//  Created by Dmitrii Gordienko on 10.04.2023.
//

import SwiftUI

struct QuestionLayoutView: View {
    var questionLayoutModel: QuestionLayoutModel = .left
    var body: some View {
        
        switch questionLayoutModel {
            case .left:
                return
                Text("1")
                
            case .right:
                return
                Text("2")
                
            case .middle:
                return
                Text("3")
                
            default:
                return
                Text("4")
                
        }
        
    }
}

struct LayoutOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionLayoutView()
    }
}
