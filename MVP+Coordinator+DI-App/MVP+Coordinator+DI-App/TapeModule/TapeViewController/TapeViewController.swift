//
//  TapeViewController.swift
//  MVP+Coordinator+DI-App
//
//  Created by Андрей Коноплев on 31.01.2021.
//

import UIKit

protocol TapeViewProtocol: class {
    
}

class TapeViewController: UIViewController, TapeViewProtocol {
    
    var presenter: TapePresenterProtocol! //inject

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    @IBAction func nextButtonDidTap(_ sender: Any) {
        presenter.showDetailed()
    }
    
}

extension TapeViewController: Storyboardable {
    static func storyboardName() -> String {
        return "Tape"
    }
}
