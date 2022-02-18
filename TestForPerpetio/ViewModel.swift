//
//  SwiftUIView.swift
//  TestForPerpetio
//
//  Created by Nazar Babyak on 17.02.2022.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        getPost()
    }
    
    func getPost() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("Failure to create URL")
            return
        }
        
        networkManager.downloadData(fromURL: url, completionHandler: { [weak self] (responseData) in
            guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: responseData) else {
                print("Failure to decode response data")
                return
            }
            
            DispatchQueue.main.async {
                self?.posts = newPosts
            }
        }, errorHandler: { error in
            print("Handle error \(error.localizedDescription)")
        })
    }
}
