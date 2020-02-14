//
//  User.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/12/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import Foundation

struct User: Codable {
    
    var objectId: Int = 0
    var name: String = ""
    var twitter: String = ""
    var pictureURL: String = ""
    var email: String? = ""
    
    enum CodingKeys: String, CodingKey {
        
        case objectId = "id"
        case name
        case twitter
        case pictureURL
        case email
    }
}

extension User: Equatable {
    static public func ==(first: User, second: User) -> Bool {
        return first.objectId == second.objectId
    }
}

extension User: Identifiable {
    var id: Int { return objectId }
}
