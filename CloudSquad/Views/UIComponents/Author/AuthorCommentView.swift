//
//  AuthorCommentView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/15/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct AuthorCommentView: View {
    
    var comment: Comment = MockedData.comment
    
    var body: some View {
        
        HStack {
            
            WebImage(imageURL: comment.author.pictureURL)
                .clipShape(Circle())
                .frame(width: 65, height: 65)
            
            VStack (alignment: .leading) {
                
                Text(comment.author.name)
                    .fontWeight(.semibold)
                    .font(.system(size: 18))
                    .foregroundColor(Color.black)
                
                Text(comment.author.twitter)
                    .foregroundColor(Color.blue)
                
                Text(comment.time)
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray.opacity(0.9))
            }
            .padding(.leading, 5)
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 10)
        .padding(.bottom, 5)
    }
}

struct AuthorCommentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorCommentView()
    }
}
