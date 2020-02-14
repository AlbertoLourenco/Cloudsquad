//
//  PostsView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/13/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct PostsView: View {
    
    @State var posts: Array<Post> = []
    
    @State var userName: String = Session.get().name.components(separatedBy: " ").first!
    @State var userAvatar: String = Session.get().pictureURL ?? ""
    
    var body: some View {
        
        ZStack {
            
            Color.white.edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.05), Color.white]),
                           startPoint: .top,
                           endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            ScrollView {
                
                VStack {
                    
                    HStack {
                        
                        Text("Welcome, \(userName)")
                        .font(.title)
                        
                        Spacer()
                        
                        WebImage(imageURL: userAvatar)
                        .frame(width: 44, height: 44)
                        .clipShape(Circle())
                        .onTapGesture {
                            Session.logout()
                        }
                    }
                    .padding()
                    
                    VStack {
                        
                        ForEach(posts) { item in

                            if item.imageURL.isEmpty {
                                PostTextView(post: item)
                            }else{
                                PostImageView(post: item)
                            }
                        }
                    }
                }
            }
        }
        .onAppear() {
            
            RequestManager.shared.loadPosts { (response) in
                self.posts = response
            }
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
