//
//  PostDetailView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/13/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct PostDetailView: View {
    
    @State var post: Post = MockedData.post
    
    var body: some View {
        
        ZStack {
            
            Color.white.edgesIgnoringSafeArea(.all)
            Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
            
            VStack {

                WebImage(imageURL: post.imageURL)
                    .frame(width: UIScreen.main.bounds.width,
                           height: post.imageURL.isEmpty ? 0 : 210,
                           alignment: .center)
                    .clipped()
                
                ScrollView (.vertical) {
                    
                    VStack {

                        VStack {

                            AuthorPostView(post: post)

                            Text(post.text)
                                .fontWeight(.medium)
                                .font(.system(size: 16))
                                .foregroundColor(Color.black.opacity(0.6))
                                .padding(.horizontal)
                            
                            SocialStatsView(post: post)
                                .padding(10)
                        }

                        VStack (spacing: 20) {

                            ForEach (post.comments) { item in
                                CommentView(comment: item)
                            }
                        }
                        .opacity(post.comments.count == 0 ? 0 : 1)
                        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                        .padding(.bottom, 25)
                    }
                }
            }
            
            VStack {

                ButtonClose()
                    .offset(x: -4, y: 20)
                    .onTapGesture {
                        SharedViewData.shared.showPostsDetail = false
                    }
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear() {
            
            RequestManager.shared.loadPost(id: self.post.id) { (response) in
                
                if let object = response {
                    self.post = object
                }
            }
        }
        .onDisappear() {
            SharedViewData.shared.showPostsDetail = false
        }
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView()
    }
}
