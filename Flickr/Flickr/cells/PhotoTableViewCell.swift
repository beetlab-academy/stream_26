//
//  PhotoTableViewCell.swift
//  Flickr
//
//  Created by Андрей Коноплев on 12.12.2020.
//

import UIKit
import Kingfisher
class PhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
    }

    func configure(with model: PhotoModel) {
        guard let urlString = model.url, let url = URL(string: urlString) else { return }
        photoImageView.kf.setImage(with: url)
    }
    
}
