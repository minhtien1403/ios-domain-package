//
//  File.swift
//  Domain
//
//  Created by partnertientm2 on 4/11/25.
//

import Foundation
import Combine
import Data

public protocol GetListUserUsecase {
    
    func getListUser(perPage: Int, since: Int) -> AnyPublisher<Result<[User], APIError>, Never>
}

public class GetListUserUsecaseImpl: GetListUserUsecase {
    
    private let repository: UserRepository
    
    public init(repository: UserRepository) {
        self.repository = repository
    }
    
    public func getListUser(perPage: Int, since: Int) -> AnyPublisher<Result<[User], APIError>, Never> {
        repository.getListUser(param: .init(perPage: perPage, since: since))
            .autoDecode()
    }
}
