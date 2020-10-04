//
//  UserViewModel.swift
//  DemoMVVM
//
//  Created by Git on 04/10/20.
//  Copyright © 2020 Github. All rights reserved.
//

import Foundation
/***
 Name
 Username
 Address details
 Company Detail
 Phone & Website
 */

class UserViewModel {
    private let user: User
    
    var displayName: String {
        return user.name
    }
    var displayUserName: String {
        return user.username
    }
    
    var displayaddress: String {
        let address = user.address
        return "\(address.street) \(address.suite) \(address.city) \(address.zipcode)"
    }
    
    var displayShortCompanyName: String {
        let company = user.company
        return "\(company.name)"
    }
    
    var displayCompanyDetail: String {
        let company = user.company
        return "\(company.name) \(company.catchPhrase) \(company.bs)"
    }
    
    var displayphoneNumber: String {
        return user.phone
    }
    
    var displayWebsite: String {
        return user.website
    }
    
    var isFavourite = Dynamic(value: false)
    
    init(user: User) {
        self.user = user
    }
}
