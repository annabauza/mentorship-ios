//
//  HomeServiceProtocol.swift
//  Created on 28/06/2020
//  Created for AnitaB.org Mentorship-iOS
//

import Foundation
import Combine

protocol HomeServiceProtocol {
    func fetch(token: String, receiveValue: @escaping ((ProfileModel.ProfileData? ,HomeModel.HomeResponseData?) -> Void)) -> AnyCancellable?
}
