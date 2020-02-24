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
            
            AuthorView(time: comment.time, author: comment.author)
            
            Divider()
                .background(Color("Shadow"))
            
            Text(comment.text)
                .fontWeight(.medium)
                .font(.system(size: 16))
                .foregroundColor(Color("Text-Primary"))
                .padding(10)
        }
        .padding(10)
        .frame(width: Constants.screenWidth, alignment: .center)
        .background(Color("Background-Secondary"))
        .clipped()
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Shadow"), lineWidth: 1))
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
            .environment(\.colorScheme, .dark)
    }
}
