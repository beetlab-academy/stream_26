//
//  DetailedPresenter.swift
//  MVP+Coordinator+DI-App
//
//  Created by Андрей Коноплев on 31.01.2021.
//

import Foundation

protocol DetailedPresenterProtocol: class {
    
}

class DetailedPresenter: DetailedPresenterProtocol {
    
    weak var view: DetailedViewProtocol! // inject
    weak var coordinator: TapeCoordinatorProtocol! //inject
    
}
