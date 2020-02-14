//
//  WebImage.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/13/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import SwiftUI

struct WebImage: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    var body: some View {
        
        VStack {
            Image(uiImage: (imageLoader.data.count == 0) ? UIImage(named: "Placeholder")! : UIImage(data: imageLoader.data)!)
                .resizable()
                .scaledToFill()
        }
    }
    
    init(imageURL: String) {
        
        imageLoader = ImageLoader(url: imageURL)
    }
}

class ImageLoader: ObservableObject {
    
    var cache = ImageCache.shared
    
    @Published var data = Data()
    
    init(url: String) {
        
        if let imageData = cache.getData(url: url) { // image already loaded
            
            self.data = imageData
            
        }else{
            
            guard let imgURL = URL(string: url) else { return }
            
            URLSession.shared.dataTask(with: imgURL) { (response, _, _) in
                
                guard let dt = response else {
                    return
                }
                
                DispatchQueue.main.async {
                    self.data = dt
                    
                    self.cache.store(url: url, data: dt)
                }
                
            }.resume()
        }
    }
    
}

class ImageCache {
    
    static var shared = ImageCache()
    
    var imageURLs: Array<Dictionary<String, Any>> = []
    
    func store(url: String, data: Data) {
        imageURLs.append(["url": url, "data": data])
    }
    
    func getData(url: String) -> Data? {
        
        for dict in imageURLs {
            if let imageURL = dict["url"] as? String, imageURL == url {
                return dict["data"] as? Data
            }
        }
        
        return nil
    }
}
