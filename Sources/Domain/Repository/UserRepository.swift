//
//  File.swift
//  Domain
//
//  Created by partnertientm2 on 18/12/25.
//

import Foundation
import Combine

public protocol UserRepository {
    
    func getListUser(perPage: Int, since: Int) -> AnyPublisher<Result<Data, APIError>, Never>
    func getUserDetails(userName: String) -> AnyPublisher<Result<Data, APIError>, Never>
}
