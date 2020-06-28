//
//  HomeApiService.swift
//  Created on 28/06/2020
//  Created for AnitaB.org Mentorship-iOS 
//

import Foundation
import Combine

class HomeApiService : HomeServiceProtocol {
    
    var homeResponseData : HomeModel.HomeResponseData?
    var profileViewModel = ProfileViewModel()
    
    func fetch(token: String, receiveValue: @escaping ((ProfileModel.ProfileData?, HomeModel.HomeResponseData?) -> Void)) -> AnyCancellable {
        return NetworkManager.callAPI(urlString: URLStringConstants.Users.home, token: token)
                    .receive(on: RunLoop.main)
        .catch { _ in Just(self.homeResponseData) }
        .combineLatest(
            NetworkManager.callAPI(urlString: URLStringConstants.Users.profile, token: token)
                .receive(on: RunLoop.main)
                .catch { _ in Just(self.profileViewModel.getProfile()) }
        ).sink { home, profile in
            receiveValue(profile, home)
        }
    }
    
}
