//
//  csvTableCellTableViewCell.swift
//  ReadCSV
//
//  Created by 澤木柊斗 on 2024/02/16.
//

import UIKit
import SnapKit

class csvTableCellTableViewCell: UITableViewCell {
    var text: String!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    lazy var csvLable: UILabel = {
        let csvLabel = UILabel()
        csvLabel.textColor = .brown
        return csvLabel
    }()

}
