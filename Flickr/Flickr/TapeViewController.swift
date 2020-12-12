//
//  ViewController.swift
//  Flickr
//
//  Created by Андрей Коноплев on 12.12.2020.
//

import UIKit
import SwiftyJSON

class TapeViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            let nib = UINib(nibName: "PhotoTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: photoCellIdentidier)
        }
    }
    
    private let photoCellIdentidier = "photoTableViewCell"
    private let urlCreaterService = UrlCreaterService()
    var dataSource: [PhotoModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadPhotos()
    }
}

extension TapeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: photoCellIdentidier, for: indexPath) as! PhotoTableViewCell
        cell.configure(with: dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension TapeViewController {
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
                self.tableView.reloadData()
            }
        } failure: { (error) in
            print(error)
        }

    }
}

