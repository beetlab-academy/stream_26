//
//  TapePresenter.swift
//  Flickr
//
//  Created by Андрей Коноплев on 20.12.2020.
//

import Foundation
import SwiftyJSON

protocol TapePresenterProtocol: class {
    func viewDidLoad() -> Void
    func numberOfPhotos() -> Int
    func photo(at indexPath: IndexPath) -> PhotoModel
}

class TapePresenter: TapePresenterProtocol {
    
    weak var view: TapeViewProtocol!
    
    private let urlCreaterService = UrlCreaterService()
    private var dataSource: [PhotoModel] = []
    
    func viewDidLoad() {
        loadPhotos()
    }
    
    func numberOfPhotos() -> Int {
        return dataSource.count
    }
    
    func photo(at indexPath: IndexPath) -> PhotoModel {
        return dataSource[indexPath.row]
    }
    
    func loadPhotos() {
        Api_wrapper.getInteresPhoto(page: 1,
                                    per_page: 20) { [weak self] (response) in
            
            DispatchQueue.main.async {
                guard let self = self else { return }
                let json = JSON(response)
                let jsonPhotosArray = json["photos"]["photo"].arrayValue
                
                var photos: [PhotoModel] = []
                
                
                for jsonPhoto in jsonPhotosArray {
                    let id = jsonPhoto["id"].stringValue
                    let owner = jsonPhoto["owner"].stringValue
                    let secret = jsonPhoto["secret"].stringValue
                    let server = jsonPhoto["server"].stringValue
                    let farm = jsonPhoto["farm"].intValue
                    let title = jsonPhoto["title"].stringValue
                    
                    let model = PhotoModel(id: id, owner: owner, secret: secret, server: server, farm: farm, title: title)
                    
                    let url = self.urlCreaterService.createUrl(withModel: model)
                    model.url = url
                    photos.append(model)
                }
                
                self.dataSource = photos
                self.view.reloadData()
            }
        } failure: { (error) in
            self.view.showEror(error: error)
        }
    }
    
}

