//
//  PostImageView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/13/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct PostImageView: View {
    
    var post: Post!
    
    var body: some View {

        VStack {

            WebImage(imageURL: post.imageURL)
            .frame(height: 200)
            .clipped()
            .cornerRadius(20)
            .edgesIgnoringSafeArea(.all)
            
            Text(post.text)
            .font(.body)
            .foregroundColor(Color.black.opacity(0.6))
            
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
        .frame(width: UIScreen.main.bounds.width - 40, height: 400)
        .background(Color.white)
        .clipped()
        .cornerRadius(20)
        .shadow(color: Color.gray.opacity(0.5), radius: 20, x: 0, y: 0)
        .onTapGesture {
            
            SharedViewData.shared.post = self.post
            SharedViewData.shared.showPostsDetail = true
        }
    }
}
