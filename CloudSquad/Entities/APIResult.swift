//
//  APIResult.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/15/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import Foundation

struct APIResult: Codable {
    
    var result: Bool!
    var message: String!
    
    enum CodingKeys: String, CodingKey {
        
        case result
        case message
    }
}
