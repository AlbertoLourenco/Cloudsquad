//
//  PostDetailView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/13/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct PostDetailView: View {
    
    var post: Post!
    
    var body: some View {
        
        ZStack {
            
            Color.white.edgesIgnoringSafeArea(.all)
            
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.05), Color.white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            WebImage(imageURL: post.imageURL)
                .frame(width: 200, height: 200, alignment: .center)
        }
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView()
    }
}
