//
//  User.swift
//  WorkShopDemo
//
//  Created by Gurung Bishow on 17/11/19.
//  Copyright © 2019 Gurung Bishow. All rights reserved.
//

import Foundation
struct User: Decodable {
    var id: Int?
    var email: String?
    var firstName: String?
    var lastName: String?
    var profilePic: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case profilePic = "avatar"
    }
    
}

class Pagination<T: Decodable> : Decodable {
    var page: Int?
    var perPage: Int?
    var totalData: Int?
    var totalPages: Int?
    var data: [T] = []
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case totalData = "total"
        case totalPages = "total_pages"
        case data
    }
}

