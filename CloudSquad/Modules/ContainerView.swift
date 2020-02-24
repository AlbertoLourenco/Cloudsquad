//
//  ContainerView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/13/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct ContainerView: View {
    
    @ObservedObject private var viewStates = SharedViewData.shared
    
    var body: some View {
        
        ZStack {
            
            //---------------------------
            //  Root view
            //---------------------------
            
            if Session.authenticated() {
                PostsView()
            }else{
                LoginView()
            }
            
            //---------------------------
            //  Posts - List
            //---------------------------
            
            if viewStates.showPosts {
                PostsView()
            }
            
            //---------------------------
            //  Posts - Add
            //---------------------------
            
            if viewStates.showPostsAdd {
                SheetView(type: .postAdd)
            }
            
            //---------------------------
            //  Posts - Detail
            //---------------------------
            
            if viewStates.showPostsDetail {
                SheetView(type: .postDetail)
            }
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
