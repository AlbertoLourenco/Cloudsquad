//
//  LoadingView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/15/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    
    var lottieFile: String = ""
    
    var body: some View {
        
        ZStack {
            
            Color.black.opacity(0.5)
                .animation(.linear)
                .edgesIgnoringSafeArea(.all)
            
            LottieView(filename: lottieFile)
                .offset(y: 0)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        }
        .highPriorityGesture(DragGesture())
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
