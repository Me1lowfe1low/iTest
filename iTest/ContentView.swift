//
//  ContentView.swift
//  iTest
//
//  Created by Dmitrii Gordienko on 15.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State var sideBarIsOpen: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    DetailView(title: "About", isExpanded: sideBarIsOpen)
                        
                } label: {
                    Label("About", systemImage: "info.circle")
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Sidebar")
            
            Text("Please select a section")
                .font(.largeTitle)
                
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
        .previewInterfaceOrientation(.landscapeLeft)
    }
}


