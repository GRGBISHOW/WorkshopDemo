//
//  UserTableViewCell.swift
//  WorkShopDemo
//
//  Created by Gurung Bishow on 17/11/19.
//  Copyright © 2019 Gurung Bishow. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell, ViewIdentifiable {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var cellViewModel: UserCellViewModel! {
        didSet {
            pupulateData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func setupUI() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height/2
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderWidth = 2.0
        avatarImageView.layer.borderColor = UIColor.green.cgColor
    }
    
    private func pupulateData() {
        nameLabel.text = cellViewModel.fullName
        emailLabel.text =  cellViewModel.email
        guard let url = cellViewModel.imageUrl else {return}
        avatarImageView.setImage(fromUrl: url)
    }

}
