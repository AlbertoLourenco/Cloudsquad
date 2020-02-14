//
//  SocialStatsView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/14/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct SocialStatsView: View {
    
    var post: Post = MockedData.post
    
    var body: some View {
        
        HStack {
            Spacer()
            HStack (spacing: 15) {

                Image("Post-Like")
                    .resizable()
                    .clipped()
                    .frame(width: 20, height: 20)
                
                Text("\(post.amountLikes)")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black.opacity(0.5))
            }
            .padding(.horizontal)
            
            Divider()
            
            HStack (spacing: 15) {

                Image("Post-Comment")
                    .resizable()
                    .clipped()
                    .frame(width: 20, height: 20)
                
                Text("\(post.amountComments)")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black.opacity(0.5))
            }
            .padding(.horizontal)
        }
        .frame(width: UIScreen.main.bounds.width - 40, height: 20, alignment: .leading)
        .padding(.horizontal)
    }
}

struct SocialStatsView_Previews: PreviewProvider {
    static var previews: some View {
        SocialStatsView()
    }
}
