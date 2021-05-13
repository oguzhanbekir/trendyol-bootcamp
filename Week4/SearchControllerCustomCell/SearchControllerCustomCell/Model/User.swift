//
//  User.swift
//  SearchControllerCustomCell
//
//  Created by Oguzhan Bekir on 5.05.2021.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name : String
    let username: String
    let email: String
    let company: Company
}

struct Company: Decodable {
    let name: String
}
