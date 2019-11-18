//
//  ViewModel.swift
//  WorkShopDemo
//
//  Created by Gurung Bishow on 12/11/19.
//  Copyright © 2019 Gurung Bishow. All rights reserved.
//

import Foundation
class UserListViewModel {
    var userLists: [User] = []
    let session = URLSession.shared
    let url = URL(string: "https://reqres.in/api/users?page=1&&per_page=50")
    init() {}
    
    func getUserlist(_ completion: @escaping (Bool) -> Void) {
        let dataTask = session.dataTask(with: url!, completionHandler: {[weak self] data, response, error in
            if error == nil {
                do {
                    let response = try JSONDecoder().decode(Pagination<User>.self, from: data!)
                    self?.userLists = response.data
                    completion(true)
                } catch {
                    print(error)
                     completion(false)
                }
            }
       })
        dataTask.resume()
    }
}

enum Constants {
    static let normalCellIdentifier = "normalCell"
}
