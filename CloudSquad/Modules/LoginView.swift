//
//  LoginView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/9/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State private var show: Bool = false
    @State private var email: String = "alberto.lourenco8@gmail.com"
    @State private var password: String = "123456"
    @State private var showingKeyboard: Bool = false
    
    var body: some View {
        
        ZStack {
            Color("Background-Primary")

            VStack (alignment: .center) {
                
                Text("Make login with\nyour e-mail and password\nthat you've used in register.")
                    .fontWeight(Font.Weight.bold)
                    .foregroundColor(Color("Text-Primary"))
                
                Spacer()
                
                TextField("E-mail", text: $email)
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                
                Button(action: handleSignInAction) {
                    HStack {
                        Spacer()
                        Text("Sign In")
                        Spacer()
                    }
                }
                .padding()
                .foregroundColor(Color.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding(EdgeInsets(top: 30, leading: 25, bottom: 30, trailing: 25))
            .frame(width: 300, height: 350, alignment: Alignment.center)
            .background(Color("Background-Secondary"))
            .clipped()
            .cornerRadius(20)
            .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 0)
            .rotation3DEffect(Angle.init(degrees: show ? 0 : 15), axis: (x: 0, y: 10, z: 0))
            .opacity(show ? 1 : 0)
            .offset(y: showingKeyboard ? -100 : 0)
            .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0))

        }
        .edgesIgnoringSafeArea(.all)
        .onDisappear() {
            self.show = false
        }
        .onAppear {
            
            withAnimation(Animation.easeInOut.delay(2)) {
                self.show.toggle()
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification,
                                                   object: nil,
                                                   queue: .main) { (notification) in
                self.showingKeyboard = true
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification,
                                                   object: nil,
                                                   queue: .main) { (notification) in
                self.showingKeyboard = false
            }
        }
    }
    
    private func handleSignInAction() {
        
        RequestManager.shared.login(email: email, password: password) { (result) in
            
            if result {
                SharedViewData.shared.showPosts = true
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environment(\.colorScheme, .light)
    }
}

struct LoginView_PreviewsDark: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environment(\.colorScheme, .dark)
    }
}
