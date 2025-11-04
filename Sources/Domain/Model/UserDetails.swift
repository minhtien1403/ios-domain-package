//
//  File.swift
//  Domain
//
//  Created by partnertientm2 on 4/11/25.
//

import Foundation

public struct UserDetails: Codable {
    
    public let login: String
    public let avatarURL: String
    public let blog: String
    public let location: String?
    public let followers: Int
    public let following: Int
    public let name: String
    
    public init(login: String, avatarURL: String, blog: String, location: String?, followers: Int, following: Int, name: String) {
        self.login = login
        self.avatarURL = avatarURL
        self.blog = blog
        self.location = location
        self.followers = followers
        self.following = following
        self.name = name
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.login = try container.decode(String.self, forKey: .login)
        self.name = try container.decode(String.self, forKey: .name)
        self.blog = try container.decode(String.self, forKey: .blog)
        self.location = try container.decodeIfPresent(String.self, forKey: .location)
        self.followers = try container.decode(Int.self, forKey: .followers)
        self.following = try container.decode(Int.self, forKey: .following)
        self.avatarURL = try container.decode(String.self, forKey: .avatarURL)
    }

    enum CodingKeys: String, CodingKey {
        case login, name, blog, location, followers, following
        case avatarURL = "avatar_url"
    }
}
