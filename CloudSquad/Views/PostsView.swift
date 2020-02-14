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
            
            LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.05), Color.white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack {
                    
                    Text("Welcome, \(userName)")
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                    
                    Spacer()
                    
                    WebImage(imageURL: userAvatar)
                        .frame(width: 44, height: 44)
                        .clipShape(Circle())
                        .onTapGesture {
                            Session.logout()
                        }
                }
                .padding(.horizontal)
                .padding(.top, 64)
                
                ScrollView (.vertical, showsIndicators: false) {

                    VStack (spacing: 30) {
                        
                        ForEach(posts) { item in

                            if item.imageURL.isEmpty {
                                PostTextView(post: item)
                            }else{
                                PostImageView(post: item)
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 20, leading: 30, bottom: 30, trailing: 30))
                    .frame(width: UIScreen.main.bounds.width)
                }
                
                Spacer()
            }
        }
        .onAppear() {
            
            RequestManager.shared.loadPosts { (response) in
                self.posts = response
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
