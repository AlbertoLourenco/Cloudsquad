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
            
            Text(post.text)
                .fontWeight(Font.Weight.bold)
                .foregroundColor(Color.black.opacity(0.6))
            
            Spacer()
        }
        .padding(EdgeInsets(top: 30, leading: 25, bottom: 30, trailing: 25))
        .frame(width: UIScreen.main.bounds.width - 40, height: 400, alignment: .center)
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
