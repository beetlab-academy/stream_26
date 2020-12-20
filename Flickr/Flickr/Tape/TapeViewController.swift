//
//  ViewController.swift
//  Flickr
//
//  Created by Андрей Коноплев on 12.12.2020.
//

import UIKit
import SwiftyJSON

protocol TapeViewProtocol: class {
    func reloadData() -> Void
    func showEror(error: String?)
}

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
    
    var presenter: TapePresenterProtocol!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension TapeViewController: TapeViewProtocol {
    func reloadData() {
        tableView.reloadData()
    }
    
    func showEror(error: String?) {
        let alertController = UIAlertController(title: "Ошибка", message: error ?? "Неизвестная ошибка", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Окей", style: .default) { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension TapeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfPhotos()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: photoCellIdentidier, for: indexPath) as! PhotoTableViewCell
        let photoModel = presenter.photo(at: indexPath)
        cell.configure(with: photoModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = presenter.photo(at: indexPath)
        showDetailedWith(photo: model)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension TapeViewController {
    func showDetailedWith(photo: PhotoModel) {
        let vc = DetailedViewController.create()
        vc.photo = photo
        self.present(vc, animated: true, completion: nil)
    }
}

extension TapeViewController: Storyboardable {
    static func storyboardName() -> String {
        return "Main"
    }
}
