//
//  Iteractor.swift
//  DatnaManagement
//
//  Created by user159106 on 12/4/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import Foundation

class Interactor {
    let dataManager : DataManager
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
}

extension Interactor : InteractorProtocol {
    func getAllMesseges(withCompletion: @escaping (Result<User>) -> Void) {
        self.dataManager.getAllUsers { result in
            switch result {
                
            case .succes(let configuration):
                withCompletion(.succes(configuration))
            case .failure(let error):
                withCompletion(.failure(error))
            
            }
        }
    }
    
    
}
