//
//  DemoMVVMTests.swift
//  DemoMVVMTests
//
//  Created by Git on 04/10/20.
//  Copyright © 2020 Github. All rights reserved.
//

import XCTest
@testable import DemoMVVM



class DemoMVVMTests: XCTestCase {
    
    var viewModel: UserViewModel!
    
    override func setUpWithError() throws {
        do {
            let user = try MockUser().getUser()
            viewModel = UserViewModel(user: user)
        } catch  {
            XCTFail(error.localizedDescription)
        }
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testViewModel() throws {
        XCTAssertEqual(viewModel.displayName, "Leanne Graham")
        XCTAssertEqual(viewModel.displayUserName, "Bret")
        XCTAssertEqual(viewModel.displayphoneNumber, "1-770-736-8031 x56442")
        XCTAssertEqual(viewModel.displayWebsite, "hildegard.org")
        XCTAssertEqual(viewModel.displayShortCompanyName, "Romaguera-Crona")
        XCTAssertEqual(viewModel.displayCompanyDetail, "Romaguera-Crona Multi-layered client-server neural-net harness real-time e-markets")
    }
}
