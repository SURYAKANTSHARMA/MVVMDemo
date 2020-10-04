//
//  DetailViewController.swift
//  DemoMVVM
//
//  Created by tokopedia on 04/10/20.
//  Copyright © 2020 Github. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var companyDetailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var isFavouriteButton: UIButton!
    
    var viewModel: UserViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        guard let viewModel = viewModel else { return }
        
        nameLabel.text = viewModel.displayName
        userNameLabel.text = viewModel.displayUserName
        addressLabel.text = viewModel.displayaddress
        companyDetailLabel.text = viewModel.displayCompanyDetail
        phoneLabel.text = viewModel.displayphoneNumber
        websiteLabel.text = viewModel.displayWebsite
        viewModel.isFavourite.appendAndFire { isFavourite in
            self.isFavouriteButton.setImage(isFavourite ?  UIImage(systemName: "star.fill") : UIImage(systemName: "star"), for: .normal)
        }
    }
   
    @IBAction func isFavouriteButtonTapped(_ sender: UIButton) {
        guard let viewModel = viewModel else { return }
        viewModel.isFavourite.value = !viewModel.isFavourite.value
    }
}
