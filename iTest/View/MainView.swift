//
//  MainView.swift
//  iTest
//
//  Created by Dmitrii Gordienko on 09.04.2023.
//

import SwiftUI
import Firebase

struct MainView: View {
    //private var twoRowGrid = [GridItem(.fixed( 200), spacing: 5), GridItem(.fixed( 200), spacing: 5)]
    private var twoRowGrid = [GridItem(.flexible(minimum: 200)), GridItem(.flexible(minimum: 200))]
    @State var sortOrder: SortOrder = .alphabetical
    @State var layoutModel: LayoutModel = .grid
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    ProfilePictureView(image: Image(systemName: "person.fill"), size: 50)
                        
                    Text("\(showName())")
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            //.stroke(lineWidth: 1.0)
                            .fill(Color(UIColor.systemGroupedBackground))
                            .frame(width: 150, height: 50)
                        Picker("", selection: $sortOrder)
                        {
                            ForEach(SortOrder.allCases)  {
                                type in
                                Text(type.title)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            //.stroke(lineWidth: 1.0)
                            .fill(Color(UIColor.systemGroupedBackground))
                            .frame(width: 150, height: 50)
                        Picker("", selection: $layoutModel)
                        {
                            ForEach(LayoutModel.allCases)  {
                                type in
                                Text(type.title)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                }
                .padding()
                
                Divider()
                Section("Your tests") {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: twoRowGrid, alignment: .firstTextBaseline)
                        {
                            ForEach(0..<20) { _ in
                                TestPreviewButton()
                                    .aspectRatio(1, contentMode: .fit)
                            }
                            PlusButton()
                        }
                    }
                }
                
                Section("Saved test") {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: twoRowGrid)
                        {
                            ForEach(0..<4) { _ in
                                TestPreviewButton()
                                    .aspectRatio(1, contentMode: .fit)
                            }
                            PlusButton()
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Main")
    }
    
    func showName() -> String {
        guard let userName = Auth.auth().currentUser else {
            return "Unknown user name"
        
        }
        return userName.displayName!
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
