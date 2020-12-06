//
//  CustomTableViewCell.swift
//  tableView
//
//  Created by Andrei Konoplev on 06.12.2020.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    

    
    //вызывается при ините через xib. В этом методе мы можем задать нужный лейаут для наших аутлетов
     override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    func configure(with model: DialogModel) {
        avatarImageView.image = model.avatar
        nameLabel.text = model.name
        descriptionLabel.text = model.preview
    }
    
    fileprivate func setupLayout() {
        
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = 25
        
        nameLabel.font = .systemFont(ofSize: 18, weight: .medium)
        
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.textColor = UIColor.gray.withAlphaComponent(0.8)
        
    }
    
}
