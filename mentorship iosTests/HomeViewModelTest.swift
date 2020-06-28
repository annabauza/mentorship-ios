//
//  HomeViewModelTest.swift
//  Created on 28/06/2020
//  Created for AnitaB.org Mentorship-iOS 
//

import Foundation
import Combine

import XCTest
@testable import mentorship_ios

class MockHomeService: HomeServiceProtocol{
    func fetch(token: String, receiveValue:@escaping ((ProfileModel.ProfileData? ,HomeModel.HomeResponseData?) -> Void)) -> AnyCancellable? {
        var mockProfileData = ProfileModel.ProfileData(id: 1, email: "test@test.com")
        var mockHomeResposeData = HomeModel.HomeResponseData(asMentor: nil, asMentee: nil, tasksToDo: nil, tasksDone: nil);
        receiveValue(mockProfileData, mockHomeResposeData)
        return nil
    }
    
}

class HomeViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmptyHomeResponseData() throws {
        let homeViewModel = HomeViewModel(homeService: MockHomeService())
        XCTAssertEqual(homeViewModel.relationsListData.relationCount[0], 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
