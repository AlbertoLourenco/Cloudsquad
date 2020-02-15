//
//  PostAddView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/14/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI
import UIKit

struct PostAddView: View {
    
    @State var postText: String = ""
    @State var postImage: Image?
    @State var postImageData: Data?
    
    @State var showImagePicker: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color.white.edgesIgnoringSafeArea(.all)
            Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 15) {

                ButtonClose()
                    .padding(.top, 20)
                    .onTapGesture {
                        SharedViewData.shared.showPostsAdd = false
                    }
                
                HStack {
                    
                    MultilineTextField("Tell us what are you thinking now...", text: $postText, onCommit: nil)
                        .padding(20)
                }
                .frame(minHeight: 100)
                .background(Color.white)
                
                HStack {

                    ZStack (alignment: postImage == nil ? .leading : .trailing) {
                        
                        Text("Add an image?")
                            .opacity(postImage == nil ? 1 : 0)
                            .frame(width: 170, alignment: postImage == nil ? .trailing : .leading)
                            .padding(10)
                            .foregroundColor(postImage == nil ? Color.gray.opacity(0.6) : Color.clear)
                        
                        postImage?
                            .resizable()
                            .scaledToFill()
                            .frame(width: 190, height: 60)
                        
                        Image(systemName: postImage == nil ? "camera" : "xmark")
                            .frame(width: 60, height: 60)
                            .background(Color.white)
                            .foregroundColor(postImage == nil ? Color(UIColor(red:0.23, green:0.20, blue:0.61, alpha:1.0)) : Color.red)
                            .clipShape(Circle())
                            .shadow(color: Color.gray.opacity(0.4), radius: 20, x: 0, y: 0)
                    }
                    .frame(width: 190, height: 60, alignment: .leading)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .shadow(color: Color.gray.opacity(0.4), radius: 20, x: 0, y: 0)
                    .animation(.spring())
                    .onTapGesture {
                        
                        if self.postImage == nil {
                            self.showImagePicker = true
                        }else{
                            self.postImage = nil
                        }
                    }
                    
                    Spacer()
                    
                    Button("Post it!") {
                        self.addPost()
                    }
                    .frame(width: 80)
                    .padding(20)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .bottom, endPoint: .trailing))
                    .foregroundColor(Color.white)
                    .font(.headline)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .shadow(color: Color.gray.opacity(0.4), radius: 20, x: 0, y: 0)
                }
                .padding(.top, 20)
                .frame(width: Constants.screenWidth, height: 60)
                
                Spacer()
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$postImage)
        }
        .onDisappear() {
            SharedViewData.shared.showPostsAdd = false
        }
    }
    
    func addPost() {
        
    }
}

struct PostAddView_Previews: PreviewProvider {
    static var previews: some View {
        PostAddView()
    }
}
