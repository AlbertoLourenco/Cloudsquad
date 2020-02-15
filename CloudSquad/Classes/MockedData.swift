//
//  MockedData.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/14/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import Foundation

struct MockedData {
    
    static var user: User {
        get {
            return User(objectId: 1,
                        name: "Alberto Lourenço",
                        twitter: "@albertoLourenc",
                        pictureURL: "https://pbs.twimg.com/profile_images/989213421903187968/AiXns3XA_400x400.jpg",
                        email: "alberto.lourenco8@gmail.com")
        }
    }
    
    static var comment: Comment {
        get {
            return Comment(objectId: 1,
                           text: "Todo mundo vê os porris que eu tomo, mas ninguém vê os tombis que eu levo! Mé faiz elementum girarzis, nisi eros vermeio. Per aumento de cachacis, eu reclamis.",
                           time: "1m ago",
                           author: MockedData.user)
        }
    }
    
    static var post: Post {
        get {
            return Post(objectId: 1,
                        text: "Todo mundo vê os porris que eu tomo, mas ninguém vê os tombis que eu levo! Aenean aliquam molestie leo, vitae iaculis nisl.",
//                        text: "Mussum Ipsum, cacilds vidis litro abertis. Atirei o pau no gatis, per gatis num morreus. Suco de cevadiss, é um leite divinis, qui tem lupuliz, matis, aguis e fermentis. Todo mundo vê os porris que eu tomo, mas ninguém vê os tombis que eu levo! Aenean aliquam molestie leo, vitae iaculis nisl.",
                        imageURL: "https://mussumipsum.com/assets/img/bg_home.jpg",
//                        imageURL: "",
                        time: "4h ago",
                        amountLikes: 8,
                        amountComments: 2,
                        author: MockedData.user,
                        comments: [MockedData.comment, MockedData.comment, MockedData.comment])
        }
    }
}
