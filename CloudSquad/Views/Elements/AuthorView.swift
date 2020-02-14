//
//  AuthorView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/14/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct AuthorView: View {
    
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
                
                Text(post.author.twitter)
                    .foregroundColor(Color.blue)
                
                Text(post.time)
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray.opacity(0.9))
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorView()
    }
}
