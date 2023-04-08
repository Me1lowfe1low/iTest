//
//  DetailView.swift
//  iTest
//
//  Created by Dmitrii Gordienko on 08.04.2023.
//

import SwiftUI

struct DetailView: View {
    let title: String
    @State var isExpanded: Bool = true
    
    var body: some View {
        ZStack {
            VStack {
                Color(.yellow)
            }
            if isExpanded {
                HStack {
                    Spacer()
                    SideMenu()
                }
                .transition(.move(edge: .trailing))
            }
        }
        .font(.largeTitle)
        .navigationTitle(title)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: { displayRightSideBar()  }) {
                    Image(systemName: "sidebar.right")
                }

            }
        }
        
        //.modifier(SideBarViewModifier(active: isActive))
    }
    
    func displayRightSideBar() {
        print("Before: \(isExpanded)")
        self.isExpanded.toggle()
        print("After: \(isExpanded)")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(title: "New name", isExpanded: true)
        }
    }
}

