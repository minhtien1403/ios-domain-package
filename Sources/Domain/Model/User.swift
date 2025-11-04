//
//  File.swift
//  Domain
//
//  Created by partnertientm2 on 4/11/25.
//

import Foundation

public struct User: Codable {
    
    public let login: String
    public let avatarURL: String
    public let htmlURL: String
    public let id: Int
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.login = try container.decode(String.self, forKey: .login)
        self.id = try container.decode(Int.self, forKey: .id)
        self.avatarURL = try container.decode(String.self, forKey: .avatarURL)
        self.htmlURL = try container.decode(String.self, forKey: .htmlURL)
    }
    
    public init (login: String, id: Int, avatarURL: String, htmlURL: String) {
        self.login = login
        self.id = id
        self.avatarURL = avatarURL
        self.htmlURL = htmlURL
    }

    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
        case htmlURL = "html_url"
    }
}
