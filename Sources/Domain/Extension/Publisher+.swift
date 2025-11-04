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

extension Publisher where Output == Result<Data, NetworkRequestError>, Failure == Never {
    
    func autoDecode<T: Decodable>(
        decoder: JSONDecoder = JSONDecoder()
    ) -> AnyPublisher<Result<T, NetworkRequestError>, Never> {
        self.map { result -> Result<T, NetworkRequestError> in
            switch result {
            case .success(let data):
                do {
                    let decoded = try decoder.decode(T.self, from: data)
                    return .success(decoded)
                } catch {
                    Log.error("Decoding error: \(error.localizedDescription)")
                    return .failure(.decodingError(error.localizedDescription))
                }
            case .failure(let error):
                return .failure(error)
            }
        }
        .eraseToAnyPublisher()
    }
}

