// Created for iTest on 13.04.2023
//  UserModel.swift
//  iTest
//
//
//    dmgordienko@gmail.com 2023

import Foundation

struct UserModel: Identifiable {
    var id: UUID
    var firstName: String
    var lastName: String
    var middleName: String?
    var email: String
    var image: String?
    private var password: String
  
    internal init(id: UUID = UUID(), firstName: String = "", lastName: String = "", middleName: String? = nil, email: String = "", image: String? = "", password: String = "") {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.middleName = middleName
        self.email = email
        self.image = image
        self.password = password
    }
    
    mutating func changePassword(to new: String) {
        self.password = new
    }
    
    func getEmail() -> String {
        email
    }
    
    func getPassword() -> String {
        password
    }
}
