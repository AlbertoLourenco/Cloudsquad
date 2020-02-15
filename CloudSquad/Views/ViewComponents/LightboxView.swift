//
//  LightboxView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/15/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct LightboxView: View {
    
    let dragToDismiss = DragGesture()
    
    var imageURL: String = MockedData.post.imageURL
    
    @State var dragState = CGSize.zero
    @State var lastScaleValue: CGFloat = 1.0
    
    var body: some View {
        
        ZStack {
            
            VisualEffectView(effect: UIBlurEffect(style: .dark))
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    self.dismissDown()
                }
            
            WebImage(imageURL: imageURL)
                .scaledToFit()
                .offset(y: dragState.height)
                .scaleEffect(lastScaleValue)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .gesture(dragToDismiss)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            self.lastScaleValue = value
                        }
                        .onEnded { value in
                            self.lastScaleValue = 1.0
                        }
                )
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
        .onDisappear() {
            self.dismissDown()
        }
        .highPriorityGesture(dragToDismiss
                                .onChanged { value in
                                    self.dragState = value.translation
                                }
                                .onEnded { value in

                                    let panLimit: CGFloat = 250

                                    if self.dragState.height > panLimit {

                                        //  Up limit reached - dismiss
                                        
                                        self.dragState.height = panLimit
                                        self.dismissDown()
                                        
                                    }else if self.dragState.height < -panLimit {

                                        //  Down limit reached - dismiss
                                        
                                        self.dragState.height = -panLimit
                                        self.dismissUp()
                                        
                                    }else{
                                        self.dragState = .zero
                                    }
                                })
    }
    
    private func dismissUp() {

        withAnimation {
            SharedViewData.shared.showLightbox = false
        }

        self.dragState.height = -UIScreen.main.bounds.height
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.dragState = .zero
        }
    }
    
    private func dismissDown() {

        withAnimation {
            SharedViewData.shared.showLightbox = false
        }

        self.dragState.height = UIScreen.main.bounds.height
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.dragState = .zero
        }
    }
}

struct LightboxView_Previews: PreviewProvider {
    static var previews: some View {
        LightboxView()
    }
}
