//
//  File.swift
//  Domain
//
//  Created by partnertientm2 on 4/11/25.
//

import Foundation
import Combine

public protocol UserUsecase {
    
    func getListUser(perPage: Int, since: Int) -> AnyPublisher<Result<User, APIError>, Never>
    func getUserDetails(userName: String) -> AnyPublisher<Result<UserDetails, APIError>, Never>
}

public class UserUsecaseImpl: UserUsecase {
    
    private let repository: UserRepository
    
    public init(repository: UserRepository) {
        self.repository = repository
    }
    
    public func getListUser(perPage: Int, since: Int) -> AnyPublisher<Result<User, APIError>, Never> {
        repository.getListUser(perPage: perPage, since: since)
            .autoDecode()
    }
    
    public func getUserDetails(userName: String) -> AnyPublisher<Result<UserDetails, APIError>, Never> {
        repository.getUserDetails(userName: userName)
            .autoDecode()
    }
}
