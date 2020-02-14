//
//  Comment.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/13/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import Foundation

struct Comment: Codable {
    
    var objectId: Int!
    var text: String!
    var time: String!
    
    var author: User = MockedData.user
    
    enum CodingKeys: String, CodingKey {
        
        case objectId   = "id"
        case author
        case text       = "content"
        case time
    }
}

extension Comment: Identifiable {
    var id: Int { return objectId }
}
