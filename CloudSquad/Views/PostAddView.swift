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
    @State var postImage: UIImage? = nil
    
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
                    
                    Image(systemName: "camera")
                        .frame(width: 50, height: 50, alignment: .center)
                        .background(Color.white)
                        .foregroundColor(Color(UIColor(red:0.23, green:0.20, blue:0.61, alpha:1.0)))
                        .clipShape(Circle())
                        .shadow(color: Color.gray.opacity(0.4), radius: 20, x: 0, y: 0)
                        .padding(.leading, 0)
                    
                    Text("Add an image?")
                        .foregroundColor(Color.gray.opacity(0.6))
                        .padding(.trailing, 15)
                }
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(color: Color.gray.opacity(0.4), radius: 20, x: 0, y: 0)
                .frame(width: Constants.screenWidth, height: 60, alignment: .leading)
                .onTapGesture {
                    self.showImagePicker = true
                }
                
                Spacer()
            }
            
        }
        .onDisappear() {
            SharedViewData.shared.showPostsAdd = false
        }
    }
}

struct PostAddView_Previews: PreviewProvider {
    static var previews: some View {
        PostAddView()
    }
}
