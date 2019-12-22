//
//  CardPresenter.swift
//  DatnaManagement
//
//  Created by user159106 on 12/10/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import Foundation

class CardPresenter : NSObject {
    var model : User?
    let interactor : Interactor
    weak public var view : ViewControllerProtocol?
    
    init(interactor: Interactor, model:User) {
        self.model = model
        self.interactor = interactor
    }
    
    // this is very dark magic
    fileprivate func layout (_ input: User) -> CardPresenterViewModel {
        return CardPresenterViewModel(sections: [
            input.getUserData()].flatMap({$0}))
    }
    
}

extension CardPresenter : ViewControllerProtocol {
    func refresh(_ mode: CardPresenterViewModel) {
         if let model = self.model {
                   self.view?.refresh(self.layout(model ))
               }
    }
    
}
