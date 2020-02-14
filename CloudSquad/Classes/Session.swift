//
//  Session.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/13/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct Session {
    
    static private var user: User!
    
    static func authenticated() -> Bool {
        return UserDefaults.standard.integer(forKey: "Auth_id") > 0
    }
    
    static func set(auth: User) {
        
        Session.user = auth
        
        let defaults = UserDefaults.standard
        
        defaults.setValue(auth.id, forKey: "Auth_id")
        defaults.setValue(auth.name, forKey: "Auth_name")
        defaults.setValue(auth.email, forKey: "Auth_email")
        defaults.setValue(auth.twitter, forKey: "Auth_twitter")
        defaults.setValue(auth.pictureURL, forKey: "Auth_picture")
        
        defaults.synchronize()
    }
    
    static func get() -> User {
        
        let defaults = UserDefaults.standard
        
        if defaults.integer(forKey: "Auth_id") > 0 {
            
            Session.user = User(objectId: defaults.integer(forKey: "Auth_id"),
                                name: defaults.string(forKey: "Auth_name") ?? "",
                                twitter: defaults.string(forKey: "Auth_twitter") ?? "",
                                pictureURL: defaults.string(forKey: "Auth_picture") ?? "",
                                email: defaults.string(forKey: "Auth_email") ?? "")
        }
        
        return Session.user
    }
    
    static func logout() {
        
        Session.user.objectId = -1

        UserDefaults.standard.removeObject(forKey: "Auth_id")
        UserDefaults.standard.synchronize()
    }
}
