//
//  MockUser.swift
//  DemoMVVMTests
//
//  Created by tokopedia on 04/10/20.
//  Copyright © 2020 Github. All rights reserved.
//

import Foundation
@testable import DemoMVVM

class MockUser {
    
    let jsonString = """
     {
       "id": 1,
       "name": "Leanne Graham",
       "username": "Bret",
       "email": "Sincere@april.biz",
       "address": {
         "street": "Kulas Light",
         "suite": "Apt. 556",
         "city": "Gwenborough",
         "zipcode": "92998-3874",
         "geo": {
           "lat": "-37.3159",
           "lng": "81.1496"
         }
       },
       "phone": "1-770-736-8031 x56442",
       "website": "hildegard.org",
       "company": {
         "name": "Romaguera-Crona",
         "catchPhrase": "Multi-layered client-server neural-net",
         "bs": "harness real-time e-markets"
       }
     }
     """
    
    func getUser() throws -> User  {
        let jsonData = jsonString.data(using: .utf8)!
        let user = try JSONDecoder().decode(User.self, from: jsonData)
        return user
    }
}
