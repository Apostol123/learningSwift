//
//  GenericGetMethod.swift
//  DatnaManagement
//
//  Created by user159106 on 12/3/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import Foundation




public extension URLSession {
    
 func get<T>(_ url: URL, type: T.Type, callback: @escaping(T?) -> Void) where T: Decodable{
        
        let dataTask = self.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print("Systerm error: \(error.localizedDescription)")
           
                DispatchQueue.main.sync {
                    callback(nil)
                }
                
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid Response")
                DispatchQueue.main.sync {
                    callback(nil)
                }
                return
            }
            switch httpResponse.statusCode{
            case 200 :
                guard let newData = data,
                    let result = try? JSONDecoder().decode(type, from: newData) else {
                        print("Not able to decode")
                        DispatchQueue.main.sync {
                            callback(nil)
                        }
                        return
                }
                DispatchQueue.main.sync {
                    callback(result)
                }
                
            case 404:
                print("Resource not found: \(url.absoluteURL)")
                DispatchQueue.main.sync {
                    callback(nil)
                }
                
            default: print("Undefined Error")
            DispatchQueue.main.sync {
                callback(nil)
                }
            }
            
        }
        dataTask.resume()
        
    }
    
}
