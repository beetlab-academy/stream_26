//
//  TapeAssebly.swift
//  MVP+Coordinator+DI-App
//
//  Created by Андрей Коноплев on 31.01.2021.
//

import EasyDi

protocol TapeModuleOutput: class {
    
}

class TapeAssembly: Assembly {
    
    func coordinator(output: TapeModuleOutput) -> TapeCoordinator {
        return define(scope: .lazySingleton, init: TapeCoordinator(navController: UINavigationController())) {
            $0.output = output
            $0.assembly = self
            return $0
        }
    }
    
    //MARK: - tape
    func tapeViewController(coordinator: TapeCoordinatorProtocol) -> TapeViewController {
        return define(init: TapeViewController.create()) {
            $0.presenter = self.tapePresenter(coordinator: coordinator, view: $0)
            return $0
        }
    }
    
    //MARK: - detailed
    func detailedViewController(coordinator: TapeCoordinatorProtocol) -> DetailedViewController {
        return define(init: DetailedViewController.create()) {
            $0.presenter = self.detailedPresenter(coordinator: coordinator, view: $0)
            return $0
        }
    }
}


//MARK: - presenters
private extension TapeAssembly {
    func tapePresenter(coordinator: TapeCoordinatorProtocol, view: TapeViewProtocol) -> TapePresenterProtocol {
        return define(init: TapePresenter()) {
            $0.coordinator = coordinator
            $0.view = view
            return $0
        }
    }
    
    func detailedPresenter(coordinator: TapeCoordinatorProtocol, view: DetailedViewProtocol) -> DetailedPresenterProtocol {
        return define(init: DetailedPresenter()) {
            $0.coordinator = coordinator
            $0.view = view
            return $0
        }
    }
}
