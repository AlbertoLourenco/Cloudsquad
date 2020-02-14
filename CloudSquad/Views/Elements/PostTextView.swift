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
            
            AuthorView(post: post)
                .frame(width: UIScreen.main.bounds.width - 40)
            
            Text(post.text)
                .fontWeight(.medium)
                .font(.system(size: 16))
                .foregroundColor(Color.black.opacity(0.6))
                .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 40, height: 290, alignment: .center)
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
