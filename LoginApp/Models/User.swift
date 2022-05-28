//
//  User.swift
//  LoginApp
//
//  Created by Вячеслав Турчак on 25.05.2022.
//



struct User {
    let login: String
    let password: String
    let person: Person
    
    static func createUser () -> User {
        User(
            login: "User",
            password: "Password",
            person: Person(
                name: "Viacheslav",
                lastname: "Turchak",
                age: 30,
                hobbies: ["Programming", "Music", "Sport"]
            )
        )
    }
}

struct Person {
    let name: String
    let lastname: String
    let age: Int
    let hobbies: [String]
}

