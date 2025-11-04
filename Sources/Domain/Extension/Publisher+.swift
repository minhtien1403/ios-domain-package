//
//  File.swift
//  Domain
//
//  Created by partnertientm2 on 4/11/25.
//

import Foundation
import Combine
import Data
import Shared

import Combine

extension Publisher where Output == Result<Data, NetworkRequestError>, Failure == Never {
    func autoDecode<T: Decodable>(
        decoder: JSONDecoder = JSONDecoder()
    ) -> AnyPublisher<Result<T, APIError>, Never> {
        self.map { result -> Result<T, APIError> in
            switch result {
            case .success(let data):
                do {
                    let decoded = try decoder.decode(T.self, from: data)
                    return .success(decoded)
                } catch {
                    return .failure(.decodingError(error.localizedDescription))
                }
            case .failure(let networkError):
                return .failure(APIError(from: networkError))
            }
        }
        .eraseToAnyPublisher()
    }
}

