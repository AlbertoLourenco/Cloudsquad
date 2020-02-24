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
                        .foregroundColor(Color("Text-Primary"))
                    
                    Text(user.email ?? "")
                        .font(.system(size: 14))
                        .foregroundColor(Color("Text-Secondary"))
                    
                    Text(user.twitter)
                        .font(.system(size: 14))
                        .foregroundColor(Color("Twitter"))
                }
                .padding(10)
                
                Divider()
                    .background(Color("Shadow"))
                    .frame(width: 150, alignment: .center)
                
                Text("Sign out")
                    .foregroundColor(Color("Logout"))
                    .font(.system(size: 16, weight: .regular))
                    .frame(width: 120, alignment: .center)
                    .onTapGesture {
                        Session.logout()
                    }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color("Background-Secondary"), Color("Background-Primary")]), startPoint: .top, endPoint: .bottom))
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
            .environment(\.colorScheme, .light)
    }
}

struct MenuView_PreviewsDark: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environment(\.colorScheme, .dark)
    }
}
