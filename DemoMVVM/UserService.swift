//
//  Service.swift
//  DemoMVVM
//
//  Created by Git on 04/10/20.
//  Copyright © 2020 Github. All rights reserved.
//

import Foundation

//  https://jsonplaceholder.typicode.com/users

struct UserService {
    
   private var dataTask: URLSessionDataTask?
   
    private func getURLPath() -> URL? {
        guard let urlPath = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return nil
        }
        return urlPath
    }
    
    internal mutating func fetchUsers(session: URLSession = URLSession.shared, callBack: @escaping((Result<[UserViewModel], Error>) -> Void)) {
        
        guard let urlPath = getURLPath() else {
            return
        }
        
        let urlRequest = URLRequest(url: urlPath,
                                    cachePolicy: .returnCacheDataElseLoad,
                                    timeoutInterval: 60)
        
        
        // Cancel earlier data task before start new one
        self.dataTask?.cancel()
        self.dataTask = session.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("error: \(String(describing: error?.localizedDescription))")
                callBack(.failure(error!))
                return
            }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                let viewModels = users.map(UserViewModel.init)
                callBack(.success(viewModels))
            } catch {
                print("error:\(error.localizedDescription)")
                callBack(.failure(error))
            }
        }
        dataTask?.resume()
    }
}
