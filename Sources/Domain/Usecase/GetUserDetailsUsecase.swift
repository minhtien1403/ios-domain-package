//
//  File.swift
//  Domain
//
//  Created by partnertientm2 on 4/11/25.
//

import Foundation
import Combine
import Data

public protocol GetUserDetailsUsecase {
    
    func getUserDetails(username: String) -> AnyPublisher<Result<UserDetails, NetworkRequestError>, Never>
}

public class GetUserDetailsUsecaseImpl: GetUserDetailsUsecase {
    
    private let repository: UserRepository
    
    public init(repository: UserRepository) {
        self.repository = repository
    }
    
    public func getUserDetails(username: String) -> AnyPublisher<Result<UserDetails, NetworkRequestError>, Never> {
        repository.getUserDetails(param: .init(username: username))
            .autoDecode()
    }
}
