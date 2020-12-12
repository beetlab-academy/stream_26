//
//  UrlCreaterService.swift
//  Flickr
//
//  Created by Андрей Коноплев on 12.12.2020.
//

import Foundation

//Сервис который собирает url для загрузки картинки.
class UrlCreaterService {
    func createUrl(withModel model: PhotoModel)-> String {
        let url = "https://farm\(model.farm).staticflickr.com/\(model.server)/\(model.id)_\(model.secret)_m.jpg"
        print(url)
        return url
    }
}
