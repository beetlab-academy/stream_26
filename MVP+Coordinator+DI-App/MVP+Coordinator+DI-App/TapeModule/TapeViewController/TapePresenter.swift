//
//  TapePresenter.swift
//  MVP+Coordinator+DI-App
//
//  Created by Андрей Коноплев on 31.01.2021.
//

import Foundation

protocol TapePresenterProtocol: class {
    func showDetailed() -> Void
}

class TapePresenter: TapePresenterProtocol {
    
    weak var view: TapeViewProtocol! //inject
    weak var coordinator: TapeCoordinatorProtocol! //inject
    
    func showDetailed() -> Void {
        coordinator.showDetailedViewController(id: "324")
    }
    
}
