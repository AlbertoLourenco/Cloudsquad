//
//  CommentView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/15/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct CommentView: View {
    
    var comment: Comment = MockedData.comment
    
    var body: some View {
        
        VStack (alignment: .center) {
            
            AuthorCommentView(comment: comment)
            
            Divider()
            
            Text(comment.text)
                .fontWeight(.medium)
                .font(.system(size: 16))
                .foregroundColor(Color.black.opacity(0.6))
                .padding(10)
            
        }
        .padding(10)
        .frame(width: Constants.screenWidth, alignment: .center)
        .background(Color.white)
        .clipped()
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray.opacity(0.2), lineWidth: 1))
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
