//
//  ContentView.swift
//  iTest
//
//  Created by Dmitrii Gordienko on 15.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State var sideBarIsOpen: Bool = false
    @State private var userIsLoggedIn = false
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    AuthenticationView(loggedIn: $userIsLoggedIn)
                } label: {
                    Label("Main", systemImage: "house.circle")
                }
                
                NavigationLink {
                    DetailView(title: "About", isExpanded: sideBarIsOpen)
                        
                } label: {
                    Label("About", systemImage: "info.circle")
                }
                
//                NavigationLink {
//                    AuthenticationView()
//
//                } label: {
//                    Label("Authorization", systemImage: "house.circle")
//                }
                
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Sidebar")
            //MainView()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
        .previewInterfaceOrientation(.landscapeLeft)
    }
}


