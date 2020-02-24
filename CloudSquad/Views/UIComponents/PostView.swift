//
//  PostView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/13/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct PostView: View {
    
    var post: Post = MockedData.post
    
    var body: some View {

        VStack {

            if !post.imageURL.isEmpty {
            
                WebImage(imageURL: post.imageURL)
                    .frame(width: UIScreen.main.bounds.width - 40, height: 210)
                    .clipped()
            }
            
            AuthorView(time: post.time, author: post.author)
                .frame(width: UIScreen.main.bounds.width - 40)
            
            Text(post.text)
                .fontWeight(.medium)
                .font(.system(size: 16))
                .foregroundColor(Color("Text-Primary"))
                .padding(.horizontal)
                .frame(width: Constants.screenWidth, alignment: .leading)
            
            SocialStatsView(post: post)
                .frame(width: UIScreen.main.bounds.width - 40, height: 60)
        }
        .background(Color("Background-Secondary"))
        .clipped()
        .cornerRadius(20)
        .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 0)
        .onTapGesture {
            
            SharedViewData.shared.post = self.post
            SharedViewData.shared.showPostsDetail = true
        }
        .frame(width: Constants.screenWidth)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
//            .environment(\.colorScheme, .dark)
    }
}
