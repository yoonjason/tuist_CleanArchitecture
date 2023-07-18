//
//  Genders.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/07/17.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import Foundation

struct Genders: Codable, Equatable {
    let results: [Gender]
}

struct Gender: Codable, Equatable {
    let gender: String
    let name: Name
    let picture: Picture
    let email: String
}


struct Name: Codable, Equatable {
    let title: String
    let first: String
    let last: String
}

struct Picture: Codable, Equatable {
    let large: String
    let medium: String
    let thumbnail: String
}

