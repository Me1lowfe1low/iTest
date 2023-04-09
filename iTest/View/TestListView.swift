//
//  TestListView.swift
//  iTest
//
//  Created by Dmitrii Gordienko on 23.03.2023.
//

import SwiftUI

struct TestListView: View {
    @State private var width: CGFloat
    @State private var height: CGFloat
    
    init() {
        self._width = State(initialValue: 300)
        self._height = State(initialValue: 400)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "sidebar.left")
                Spacer()
                Image(systemName: "ellipsis.circle")
            }
            .padding()
            Text("TestNames")
                .padding(.horizontal)
            Divider()
            List {
                ForEach(0...20, id: \.self) { testId in
                    Text("Test # \(testId)")
                }
                .listRowBackground(Color(UIColor.secondarySystemBackground))
            }
            .listStyle(.plain)
            .background(Color(UIColor.secondarySystemBackground))
            
            Button(action: { print("Test added")}) {
                HStack {
                    Text("Add test")
                    Image(systemName: "plus.circle")
                }
            }
        }
        .frame(width: width , height: height)
        .background(Color(UIColor.secondarySystemBackground))
    }
}

struct TestListView_Previews: PreviewProvider {
    static var previews: some View {
        TestListView()
    }
}
