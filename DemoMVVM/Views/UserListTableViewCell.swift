//
//  UserListTableViewCell.swift
//  DemoMVVM
//
//  Created by Git on 04/10/20.
//  Copyright © 2020 Github. All rights reserved.
//

import UIKit


protocol TapDelegate: AnyObject {
    func starButtonTapped(_ sender: UITableViewCell)
}

class UserListTableViewCell: UITableViewCell {

    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    
    weak var delegate: TapDelegate?
    
    @IBAction func starButtonTapped(_ sender: UIButton) {
        delegate?.starButtonTapped(self)
    }
    
    func setUp(viewModel: UserViewModel) {
        phoneNumberLabel.text = viewModel.displayphoneNumber
        nameLabel.text = viewModel.displayName
        websiteLabel.text = viewModel.displayWebsite
        companyNameLabel.text = viewModel.displayShortCompanyName
        viewModel.isFavourite.bindAndFire { isFavourite in
            self.starButton.setImage(isFavourite ?  UIImage(systemName: "star.fill") : UIImage(systemName: "star"), for: .normal)
        }
    }
}
