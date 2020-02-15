//
//  PostTextView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/13/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct PostTextView: View {

    var post: Post = MockedData.post
    
    var body: some View {
        
        VStack (alignment: .center) {
            
            AuthorPostView(post: post)
                .frame(width: Constants.screenWidth)
            
            Text(post.text)
                .fontWeight(.medium)
                .font(.system(size: 16))
                .foregroundColor(Color.black.opacity(0.6))
                .padding(.horizontal)
            
            Spacer()
            
            SocialStatsView(post: post)
                .frame(width: Constants.screenWidth, height: 40)
        }
        .padding()
        .frame(width: Constants.screenWidth, height: 290, alignment: .center)
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

struct PostTextView_Previews: PreviewProvider {
    static var previews: some View {
        PostTextView()
    }
}
