//
//  TapeAssembly.swift
//  Flickr
//
//  Created by Андрей Коноплев on 20.12.2020.
//

import UIKit

class AppAssembly {
    
    
    func tapeViewController() -> UIViewController {
        let vc = TapeViewController.create()
        let presenter = TapePresenter()
        vc.presenter = presenter
        presenter.view = vc
        return vc
    }
    
    func detailedViewController(photo: PhotoModel) -> UIViewController {
        let vc = DetailedViewController.create()
        let presenter = DetailedPresenter()
        vc.presenter = presenter
        presenter.view = vc
        vc.photo = photo
        return vc
    }
}
