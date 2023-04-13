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
    @Binding var loggedIn: Bool
    
    var body: some View {
        if loggedIn {
            MainView()
        } else {
            content
        }
    }
    
    var content: some View {
        ZStack {
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
                    login()
                } label: {
                    Text("Login")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                        )
                }
                
                
//                Button {
//                    register()
//                } label: {
//                    Text("Sign up")
//                        .bold()
//                        .foregroundColor(.white)
//                        .frame(width: 200, height: 40)
//                        .background(
//                            RoundedRectangle(cornerRadius: 10, style: .continuous)
//                        )
//                }
                
                NavigationLink { SignUpView() } label: {
                    Text("Sign up")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                        )
                }
                
                
                Button {
                    
                } label: {
                    Text("Forgot Password?")
                        .fixedSize()
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.6 , height: UIScreen.main.bounds.height/3)
        .background(.gray.opacity(0.4), in: RoundedRectangle(cornerRadius: 40) )
        .padding()
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
        loggedIn.toggle()
        print("Login successful")
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
        loggedIn.toggle()
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(loggedIn: .constant(false))
    }
}
