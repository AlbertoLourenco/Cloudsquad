//
//  ButtonClose.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/13/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct ButtonClose: View {

    var body: some View {

        VStack {
            HStack {
                Spacer()

                Image(systemName: "xmark")
                    .frame(width: 36, height: 36)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .clipShape(Circle())
            }
            Spacer()
        }
        .offset(x: -16, y: 20)
        .transition(.move(edge: .top))
        .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0))
    }
}

struct ButtonClose_Previews: PreviewProvider {
    static var previews: some View {
        ButtonClose()
    }
}
