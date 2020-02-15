//
//  SharedViewData.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/13/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

class SharedViewData: ObservableObject {
    
    static let shared = SharedViewData()
    
    @Published var post: Post = MockedData.post
    
    //  Modules
    
    @Published var showPosts: Bool = false
    @Published var showPostsAdd: Bool = false
    @Published var showPostsDetail: Bool = false
    
    //  ViewComponents
    
    @Published var showLightbox: Bool = false
}
