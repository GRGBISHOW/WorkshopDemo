//
//  ViewController.swift
//  WorkShopDemo
//
//  Created by Gurung Bishow on 10/11/19.
//  Copyright © 2019 Gurung Bishow. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController {
    @IBOutlet weak var listTableView: UITableView!
    let rowHeight: CGFloat = 80.0
    var viewModel: UserListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        self.title = "Users"
        getUserlist()
       
    }
    
    private func setupTableView() {
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    private func getUserlist() {
        self.viewModel.getUserlist {[weak self] (_) in
            DispatchQueue.main.async {
                 self?.listTableView.reloadData()
            }
        }
    }
}

extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.name, for: indexPath) as! UserTableViewCell
        cell.cellViewModel = UserCellViewModel(withUser: viewModel.userLists[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userLists.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
}


extension UserListViewController: UITableViewDelegate {
    
}
