//
//  ButtonAdd.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/14/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct ButtonAdd: View {
    
    var body: some View {
        
        VStack {
            
            Spacer()

            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                               startPoint: .bottom,
                               endPoint: .top)
                
                Color.blue.opacity(0.3)
                
                Image("Post-Add")
                    .resizable()
                    .renderingMode(Image.TemplateRenderingMode.template)
                    .foregroundColor(Color.white)
                    .scaledToFit()
                    .frame(width: 35, height: 35)
            }
            .clipShape(Circle())
            .shadow(color: Color.blue.opacity(0.6), radius: 20, x: 0, y: 0)
            .frame(width: 70, height: 70)
            .onTapGesture {
                SharedViewData.shared.showPostsAdd = true
            }
        }
        .frame(width: Constants.screenWidth, alignment: .trailing)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 30))
    }
}

struct ButtonAdd_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAdd()
    }
}
