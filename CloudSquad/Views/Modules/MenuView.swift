//
//  MenuView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/14/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    var user: User = Session.get()
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            VStack (spacing: 16) {

                WebImage(imageURL: user.pictureURL)
                    .clipped()
                    .clipShape(Circle())
                    .frame(width: 75, height: 75)
                
                VStack (spacing: 5) {
                    
                    Text(user.name)
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                        .foregroundColor(Color.black)
                    
                    Text(user.email ?? "")
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                    
                    Text(user.twitter)
                        .font(.system(size: 12))
                        .foregroundColor(Color.blue)
                }
                .padding(10)
                
                Divider()
                    .frame(width: 150, alignment: .center)
                
                Text("Sign out")
                    .foregroundColor(Color(UIColor(red:0.79, green:0.15, blue:0.15, alpha:1.0)))
                    .font(.system(size: 16, weight: .regular))
                    .frame(width: 120, alignment: .center)
                    .onTapGesture {
                        Session.logout()
                    }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.8705882353, green: 0.8941176471, blue: 0.9450980392, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .padding(.horizontal, 30)
        }
        .padding(.bottom, 30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
