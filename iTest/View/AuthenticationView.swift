// Created for iTest on 12.04.2023
//  AuthenticationView.swift
//  iTest
//
//
//    dmgordienko@gmail.com 2023

import SwiftUI
import Firebase

struct AuthenticationView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var userIsLoggedIn = false
    
    var body: some View {
        if userIsLoggedIn {
            MainView()
        } else {
            content
        }
    }
    
    var content: some View {
        ZStack {
            Color.black.opacity(0.2)
            
            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        TextField("Email", text: $email)
                            .foregroundColor(.white)
                            .font(.title3)
                            .textFieldStyle(.plain)
                            .padding(.horizontal)
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width/2, height: 1)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                }
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        SecureField("Password", text: $password)
                            .foregroundColor(.white)
                            .font(.title3)
                            .textFieldStyle(.plain)
                            .padding(.horizontal)
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width/2, height: 1)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                }
                
                Button {
                    register()
                } label: {
                    Text("Sign up")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                        )
                }
                
                Button {
                    login()
                } label: {
                    Text("Already have an account? Login")
                        .fixedSize()
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                }
            }
        }
        
        //.ignoresSafeArea()
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) {
            result, error in
            if error != nil {
                print(error!.localizedDescription)
                print((error! as NSError).userInfo)
            }
        }
        print("Login successful")
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
