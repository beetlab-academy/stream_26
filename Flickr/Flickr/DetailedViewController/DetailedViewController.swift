//
//  DetailedViewController.swift
//  Flickr
//
//  Created by Андрей Коноплев on 20.12.2020.
//

import UIKit
import Kingfisher

class DetailedViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var photo: PhotoModel?
    var presenter: DetailedPresenter?
    
    private let urlCreaterService = UrlCreaterService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let photo = photo else { return }
        let url = urlCreaterService.createUrl(withModel: photo)
        imageView.kf.setImage(with: URL(string: url))
        
    }
    
    deinit {
        print("viewController \(self) был удален из памяти")
    }

}

extension DetailedViewController: Storyboardable {
    static func storyboardName() -> String {
        return "Detailed"
    }
}
