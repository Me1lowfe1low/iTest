// Created for iTest on 13.04.2023
//  UserModel+ViewModel.swift
//  iTest
//
//
//    dmgordienko@gmail.com 2023

import Foundation
import Firebase

class UserModelViewModel: ObservableObject {
    var user: UserModel = UserModel()

    private func login() -> Bool {
        Auth.auth().signIn(withEmail: user.getEmail(), password: user.getPassword()) {
            result, error in
            if error != nil {
                print(error!.localizedDescription)
                print((error! as NSError).userInfo)
            }
        }
        return userLoggedIn()
    }
    
    private func userLoggedIn() -> Bool {
        return true
    }
    
    private func userLoggedOut() -> Bool {
        return false
    }
}
