//
//  PostDetailView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/13/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct PostDetailView: View {
    
    @ObservedObject private var sharedData = SharedViewData.shared
    
    @State var post: Post = MockedData.post
    @State private var commentText: String = ""
    @State private var showingKeyboard: Bool = false
    @State private var keyboardHeight: CGFloat = 0
    
    var body: some View {
        
        ZStack {
            
            //----------------------------------
            //  Background
            //----------------------------------
            
            Color("Background-Primary").edgesIgnoringSafeArea(.all)
            
            //----------------------------------
            //  Content
            //----------------------------------
            
            VStack (spacing: 0) {

                WebImage(imageURL: post.imageURL)
                    .frame(width: UIScreen.main.bounds.width, height: post.imageURL.isEmpty ? 0 : 210)
                    .clipped()
                    .onTapGesture {
                        
                        withAnimation {
                            self.sharedData.showLightbox = true
                        }
                    }
                
                ScrollView (.vertical, showsIndicators: false) {
                    
                    VStack (spacing: 30) {

                        VStack {

                            AuthorView(time: post.time, author: post.author)

                            Text(post.text)
                                .fontWeight(.medium)
                                .font(.system(size: 16))
                                .foregroundColor(Color("Text-Primary"))
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
                    .padding(.bottom, 110)
                }
            }
            
            //----------------------------------
            //  Close
            //----------------------------------
            
            VStack {

                ButtonClose()
                    .offset(x: -4, y: 20)
                    .onTapGesture {
                        SharedViewData.shared.showPostsDetail = false
                    }
                
                Spacer()
            }
            
            //----------------------------------
            //  Comment
            //----------------------------------

            VStack {
                
                HStack {
                    
                    TextField("Leave a comment", text: $commentText)
                        .frame(height: 20)
                        .padding(15)
                        .background(Color("Background-Primary"))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    
                    Button(action: {
                        self.addComment()
                    }) {
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .renderingMode(Image.TemplateRenderingMode.template)
                            .frame(width: 28, height: 28)
                            .padding(10)
                            .foregroundColor(Color("Send"))
                    }
                    .frame(width: 50, height: 50)
                }
                .padding(15)
                .padding(.leading, 5)
                .frame(width: Constants.screenWidth)
                .background(VisualEffectView(effect: UIBlurEffect(style: .regular)).background(Color(UIColor(red:0.23, green:0.20, blue:0.61, alpha:1.0)).opacity(0.1)))
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .clipped()
                .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 0)
            }
            .offset(y: showingKeyboard ? -(keyboardHeight - 20) : (UIScreen.main.bounds.height/2) - 100)
            .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0))
            
            //----------------------------------
            //  Lightbox
            //----------------------------------
            
            if self.sharedData.showLightbox {

                LightboxView(imageURL: SharedViewData.shared.post.imageURL)
                    .opacity(self.sharedData.showLightbox ? 1 : 0)
                    .animation(.linear)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            self.showingKeyboard = false
            
            UIApplication.shared.endEditing()
        }
        .onAppear() {
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                                   object: nil,
                                                   queue: .main) { (notification) in
                self.showingKeyboard = true
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification,
                                                   object: nil,
                                                   queue: .main) { (notification) in
                self.showingKeyboard = false
            }
            
            self.loadData()
        }
        .onDisappear() {
            SharedViewData.shared.showPostsDetail = false
        }
    }
    
    private func loadData() {

        RequestManager.shared.loadPost(id: self.post.id) { (response) in
            
            if let object = response {
                self.post = object
            }
        }
    }
    
    private func addComment() {
        
        RequestManager.shared.addComment(text: commentText, post: post) { (result) in
            
            self.commentText = ""
            
            self.loadData()
            
            self.showingKeyboard = false
            
            UIApplication.shared.endEditing()
        }
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView()
            .environment(\.colorScheme, .light)
    }
}

struct PostDetailView_PreviewsDark: PreviewProvider {
    static var previews: some View {
        PostDetailView()
            .environment(\.colorScheme, .dark)
    }
}
