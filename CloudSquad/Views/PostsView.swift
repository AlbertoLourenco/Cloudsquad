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
    
    var body: some View {
        
        ZStack {
            
            Color.white.edgesIgnoringSafeArea(.all)
            
            LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.05), Color.white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                
                HStack {
                    
                    HStack {
                        
                        Image(systemName: "icloud")
                            .frame(width: 40, height: 40, alignment: .center)
                            .background(Color.white)
                            .foregroundColor(Color(UIColor(red:0.23, green:0.20, blue:0.61, alpha:1.0)))
                            .clipShape(Circle())
                            .shadow(color: Color.gray.opacity(0.4), radius: 20, x: 0, y: 0)
                            .padding(.leading, 0)
                    }
                    .frame(width: 50, height: 40, alignment: .trailing)
                    .offset(x: 0, y: 0)
                    .onTapGesture {
                        self.showMenu = true
                    }

                    Text("Welcome!")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                    
                    Spacer()
                    
                    WebImage(imageURL: Session.get().pictureURL)
                        .frame(width: 44, height: 44)
                        .clipShape(Circle())
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

            Color.black.opacity(showMenu ? 0.5 : 0)
                .animation(.linear)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    self.showMenu = false
                }
            
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
                            
                            if value.translation.height < -120 {
                                self.dragState.height = -120
                            }else{
                                self.dragState = value.translation
                            }
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
