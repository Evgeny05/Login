//
//  User.swift
//  Login
//
//  Created by Евгений Дубиль on 03.04.2022.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getPerson() -> User {
        User(login: "User", password: "1234", person: Person(name: "Evgeny", surname: "Dubil'"))
    }
}

struct Person {
    let name: String
    let surname: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}
