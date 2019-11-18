//
//  UserCellViewModel.swift
//  WorkShopDemo
//
//  Created by Gurung Bishow on 17/11/19.
//  Copyright © 2019 Gurung Bishow. All rights reserved.
//

import Foundation
class UserCellViewModel {
    var fullName: String
    var email: String
    var imageUrl: URL?
    
    init(withUser user: User) {
        self.fullName = "\(user.firstName ?? "") \(user.lastName ?? "")"
        email = user.email ?? ""
        guard let str = user.profilePic, let url = URL(string: str) else {return}
        self.imageUrl = url
    }
}
