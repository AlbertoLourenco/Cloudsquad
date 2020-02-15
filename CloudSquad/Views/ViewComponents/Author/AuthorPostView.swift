//
//  AuthorPostView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/14/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct AuthorPostView: View {
    
    var post: Post = MockedData.post
    
    var body: some View {
        
        HStack {
            
            WebImage(imageURL: post.author.pictureURL)
                .clipShape(Circle())
                .frame(width: 65, height: 65)
            
            VStack (alignment: .leading) {
                
                Text(post.author.name)
                    .fontWeight(.semibold)
                    .font(.system(size: 18))
                    .foregroundColor(Color.black)
                
                Text(post.author.twitter)
                    .foregroundColor(Color.blue)
                
                Text(post.time)
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray.opacity(0.9))
            }
            .padding(.leading, 5)
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 10)
        .padding(.bottom, 10)
    }
}

struct AuthorPostView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorPostView()
    }
}
