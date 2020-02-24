//
//  AuthorView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/14/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct AuthorView: View {
    
    var time: String = MockedData.post.time
    var author: User = MockedData.post.author
    
    var body: some View {
        
        HStack {
            
            WebImage(imageURL: author.pictureURL)
                .clipShape(Circle())
                .frame(width: 65, height: 65)
            
            VStack (alignment: .leading) {
                
                Text(author.name)
                    .fontWeight(.semibold)
                    .font(.system(size: 18))
                    .foregroundColor(Color("Text-Primary"))
                
                Text(author.twitter)
                    .foregroundColor(Color("Twitter"))
                
                Text(time)
                    .font(.system(size: 14))
                    .foregroundColor(Color("Text-Secondary"))
            }
            .padding(.leading, 5)
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom, 10)
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorView()
//            .environment(\.colorScheme, .dark)
    }
}
