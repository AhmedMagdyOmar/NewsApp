//
//  CustomPickerTableViewCell.swift
//  Core
//
//  Created by Youssef on 01/03/2021.
//  Copyright © 2021 Orcas. All rights reserved.
//

import UIKit

class CustomPickerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var leadingImageView: UIImageView!
    @IBOutlet weak var selectionView: ViewWithButtonEffect!
    @IBOutlet weak var selectionImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func config(item: CustomPickerItemProtocol) {
        cellLabel.text = item.value
        let image: UIImage? = item.isSelected ? .init(named: "circleDot"): .init(named: "Ellipse 41")
        selectionImage.image = image
        leadingImageView.load(with: item.leadingImageUrl)
        
        if item.leadingImageUrl == nil {
            leadingImageView.isHidden = true
        } else {
            leadingImageView.isHidden = false
        }
    }
    
}
