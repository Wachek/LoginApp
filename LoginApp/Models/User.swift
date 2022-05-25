//
//  User.swift
//  LoginApp
//
//  Created by Вячеслав Турчак on 25.05.2022.
//

import UIKit

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func createUser () -> User {
        User.init(
            login: "User",
            password: "Password",
            person: Person.init(
                name: "Viacheslav",
                lastname: "Turchak",
                photo: UIImage(named: "yoda"),
                age: 30,
                hobbies: ["Programming", "Music", "Sport"]
            )
        )
    }
}

struct Person {
    let name: String
    let lastname: String
    let photo: UIImage!
    let age: Int
    let hobbies: [String]
}
