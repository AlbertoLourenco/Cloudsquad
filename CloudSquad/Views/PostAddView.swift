//
//  PostAddView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/14/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct PostAddView: View {
    
    var body: some View {
        
        ZStack {
            
            Color.white.edgesIgnoringSafeArea(.all)
            
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.05), Color.white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            Text("Hello, World!")
            
            ButtonClose()
                .onTapGesture {
                    SharedViewData.shared.showPostsAdd = false
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
