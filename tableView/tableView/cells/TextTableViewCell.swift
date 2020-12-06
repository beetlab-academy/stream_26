//
//  TextTableViewCell.swift
//  tableView
//
//  Created by Andrei Konoplev on 06.12.2020.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var longTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .purple
        longTextLabel.textColor = .white
    }

    func configure(with model: TextModel) {
        longTextLabel.text = model.text
    }
    
}
