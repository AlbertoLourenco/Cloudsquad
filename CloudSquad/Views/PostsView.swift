//
//  PostsView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/13/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct PostsView: View {
    
    @State var showMenu = false
    @State var dragState = CGSize.zero
    
    @State var posts: Array<Post> = []
    @State var userName: String = Session.get().name.components(separatedBy: " ").first!
    @State var userAvatar: String = Session.get().pictureURL
    
    var body: some View {
        
        ZStack {
            
            Color.white.edgesIgnoringSafeArea(.all)
            
            LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.05), Color.white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    WebImage(imageURL: Session.get().pictureURL)
                        .frame(width: 44, height: 44)
                        .clipShape(Circle())
                        .onTapGesture {
                            self.showMenu = true
                        }
                }
                .padding(.horizontal)
                .padding(.top, 64)

                ScrollView (.vertical, showsIndicators: false) {

                    VStack (spacing: 30) {
                        
                        ForEach(self.posts) { item in
                            
                            if item.imageURL.isEmpty {
                                PostTextView(post: item)
                            }else{
                                PostImageView(post: item)
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 20, leading: 30, bottom: 120, trailing: 30))
                    .frame(width: UIScreen.main.bounds.width)
                }
                
                Spacer()
            }
            .rotation3DEffect(Angle(degrees: showMenu ? Double(dragState.height / 10) - 10 : 0), axis: (x: 10.0, y: 0, z: 0))
            .scaleEffect(showMenu ? 0.9 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))

            ButtonAdd()

            MenuView()
                .offset(y: showMenu ? 0 : Constants.screenSize.height)
                .offset(y: dragState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showMenu.toggle()
                }
                .gesture (
                    DragGesture()
                        .onChanged { value in
                            self.dragState = value.translation
                        }
                        .onEnded { value in
                            
                            if self.dragState.height > 50 {
                                self.showMenu = false
                            }
                            self.dragState = .zero
                        }
                )
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
