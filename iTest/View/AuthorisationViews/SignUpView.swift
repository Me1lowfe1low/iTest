// Created for iTest on 13.04.2023
//  SignUpView.swift
//  iTest
//
//
//    dmgordienko@gmail.com 2023

import SwiftUI
import Firebase
import OSLog

struct SignUpView: View {
    @State private var firstName: String
    @State private var lastName: String
    @State private var middleName: String
    @State private var email: String
    @State private var image: String?
    @State private var password: String
    @State private var passwordRetype: String
    @State private var logger: Logger
    
    init() {
        self._firstName = State(initialValue: "")
        self._lastName = State(initialValue: "")
        self._middleName = State(initialValue: "")
        self._email = State(initialValue: "")
        self._image = State(initialValue: "")
        self._password = State(initialValue: "")
        self._passwordRetype = State(initialValue: "")
        self._logger = State(initialValue: Logger(subsystem: "Authentication", category: "Information"))
    }
    
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .fill(Color(UIColor.systemBackground))
                    .ignoresSafeArea(edges: [.top])
                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .ignoresSafeArea(edges: [.bottom])
            }
            
            VStack(alignment: .center) {
                ProfilePictureView(image: Image(systemName: image!), size: 300)
                    .position(x: UIScreen.main.bounds.width/2 , y: UIScreen.main.bounds.height/2)
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        TextField("Name *", text: $firstName)
                            .foregroundColor(.white)
                            .font(.title3)
                            .textFieldStyle(.plain)
                            .padding(.horizontal)
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width * 0.6, height: 1)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                }
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        TextField("Last Name *", text: $lastName)
                            .foregroundColor(.white)
                            .font(.title3)
                            .textFieldStyle(.plain)
                            .padding(.horizontal)
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width * 0.6, height: 1)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                }
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        TextField("Middle Name", text: $middleName)
                            .foregroundColor(.white)
                            .font(.title3)
                            .textFieldStyle(.plain)
                            .padding(.horizontal)
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width * 0.6, height: 1)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                }
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        TextField("Email *", text: $email)
                            .foregroundColor(.white)
                            .font(.title3)
                            .textFieldStyle(.plain)
                            .padding(.horizontal)
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width * 0.6, height: 1)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                }
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        SecureField("Password *", text: $password)
                            .foregroundColor(.white)
                            .font(.title3)
                            .textFieldStyle(.plain)
                            .padding(.horizontal)
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width * 0.4, height: 1)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                    VStack(alignment: .leading) {
                        SecureField("Retype Password *", text: $passwordRetype)
                            .foregroundColor(.white)
                            .font(.title3)
                            .textFieldStyle(.plain)
                            .padding(.horizontal)
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width * 0.4, height: 1)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                }
                
                Spacer()
                Button {
                    register()
                } label: {
                    Text("Register")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                        )
                }
                .padding()
                .disabled(!checkInput())
            }
        }
    }
    
    func checkName() -> Bool {
        !firstName.isEmpty && !lastName.isEmpty
    }
    
    func checkEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func checkPassword() -> Bool {
        !password.isEmpty && passwordRetype == password
    }
    
    func checkInput() -> Bool {
        checkName() && checkEmail(email) && checkPassword()
    }
    
    func register() {
        let handle = Auth.auth().addStateDidChangeListener { auth, user in
            auth.createUser(withEmail: email, password: password) { result, error in
                if error != nil {
                    logger.log(level: .error, "Sign Up Failed!")
                    logger.log(level: .error, "\(error!.localizedDescription)")
                }
                logger.log(level: .error, "User created")
                let changeRequest = user?.createProfileChangeRequest()
                changeRequest?.displayName = firstName + " " + lastName
                print(changeRequest?.displayName)
                changeRequest?.commitChanges { error in
                    if error != nil {
                        logger.log(level: .error, "\(error!.localizedDescription)")
                    }
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
