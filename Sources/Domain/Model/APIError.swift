//
//  File.swift
//  Domain
//
//  Created by partnertientm2 on 4/11/25.
//

import Foundation
import Data

public enum APIError: LocalizedError, Equatable {
    
    case invalidRequest
    case noInternet
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case error4xx(_ code: Int)
    case serverError
    case error5xx(_ code: Int)
    case decodingError( _ description: String)
    case urlSessionFailed(_ error: URLError)
    case timeOut
    case unknownError
    
    public var errorDescription: String? {
        switch self {
        case .decodingError(_):
            return "decode error"
        case .invalidRequest:
            return "Can not build request"
        case .unauthorized:
            return "Unauthorized"
        case .notFound:
            return "NotFound"
        case .badRequest:
            return "Bad request"
        case .forbidden:
            return "Error Code: 403 \n Forbidden"
        case .error4xx(let code):
            return "Error Code: \(code)"
        case .error5xx(let code):
            return "Error code: \(code)"
        default:
            return "unexpected errer"
        }
    }
}

extension APIError: Identifiable {
    public var id: String {
        UUID().uuidString
    }
}

extension APIError {
    init(from networkError: NetworkRequestError) {
        switch networkError {
        case .invalidRequest:
            self = .invalidRequest
        case .noInternet:
            self = .noInternet
        case .badRequest:
            self = .badRequest
        case .unauthorized:
            self = .unauthorized
        case .forbidden:
            self = .forbidden
        case .notFound:
            self = .notFound
        case .error4xx(let code):
            self = .error4xx(code)
        case .serverError:
            self = .serverError
        case .error5xx(let code):
            self = .error5xx(code)
        case .decodingError(let desc):
            self = .decodingError(desc)
        case .urlSessionFailed(let err):
            self = .urlSessionFailed(err)
        case .timeOut:
            self = .timeOut
        case .unknownError:
            self = .unknownError
        }
    }
}
