//
//  SheetView.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/14/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

enum ViewType {
    
    case postAdd
    case postDetail
}

struct SheetView: View {
    
    var type: ViewType = .postAdd
    
    @State var showSheet: Bool = false
    
    var body: some View {
        
        HStack{
            Text("")
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear() {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.showSheet = true
            }
        }
        .sheet(isPresented: $showSheet) {
            
            if self.type == .postAdd {
                PostAddView()
            }
            
            if self.type == .postDetail {
                PostDetailView(post: SharedViewData.shared.post)
            }
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
