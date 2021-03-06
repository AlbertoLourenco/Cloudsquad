//
//  RequestManager.swift
//  CloudSquad
//
//  Created by Alberto Lourenço on 2/13/20.
//  Copyright © 2020 Alberto Lourenço. All rights reserved.
//

import Foundation

struct RequestManager {
    
    static let shared = RequestManager()
    
    var manager: URLMockSession!
    
    init() {
        
        var config = MockConfig()
        
        config.baseURL = "http://albertolourenco.com.br/cloudwork/?action="
        config.timeout = 60
        config.headers = []
        config.token = ""
        config.mock = false
        config.testingFail = false
        config.testingSuccess = false
        
        manager = URLMockSession(with: config)
    }
    
    func login(email: String, password: String, completion: @escaping (_ result: Bool) -> Void) {
        
        let params = ["email": email,
                      "password": password]
        
        manager.request(method: .post,
                        type: .formData,
                        endpoint: "login",
                        parameters: params,
                        responseType: User.self) { (response, code) in

                            if let user = response as? User {

                                Session.set(auth: user)

                                completion(true)
                            }else{
                                completion(false)
                            }
        }
    }
    
    func loadPost(id: Int, completion: @escaping (_ response: Post?) -> Void) {
        
        let params = ["&post_id": id]
        
        manager.request(method: .get,
                        endpoint: "postDetail",
                        parameters: params,
                        responseType: Post.self) { (response, code) in

                            if let object = response as? Post {
                                completion(object)
                            }else{
                                completion(nil)
                            }
        }
    }
    
    func loadPosts(completion: @escaping (_ response: Array<Post>) -> Void) {

        manager.request(method: .get,
                        endpoint: "posts",
                        responseType: [Post].self) { (response, code) in

                            if let array = response as? Array<Post> {
                                completion(array)
                            }else{
                                completion([])
                            }
        }
    }
    
    func addPost(text: String, fileData: Data?, completion: @escaping (_ result: Bool) -> Void) {
        
        let params: Dictionary<String, Any> = ["id_user": Session.get().id,
                                               "text": text]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        
        var files: Array<UploadFile> = []
        
        if let data = fileData {
            
            files.append(UploadFile(data: data,
                                    name: dateFormatter.string(from: Date()),
                                    type: "jpg",
                                    fieldName: "imageFile"))
        }
        
        manager.request(method: .post,
                        type: .formData,
                        endpoint: "postAdd",
                        parameters: params,
                        files: files,
                        responseType: APIResult.self) { (response, code) in

                            completion(code == 200)
        }
    }
    
    func addComment(text: String, post: Post, completion: @escaping (_ result: Bool) -> Void) {
        
        let params: Dictionary<String, Any> = ["id_user": Session.get().id,
                                               "id_post": post.id,
                                               "text": text]
        
        manager.request(method: .post,
                        type: .formData,
                        endpoint: "commentAdd",
                        parameters: params,
                        responseType: APIResult.self) { (response, code) in
                            
                            completion(code == 200)
        }
    }
}
