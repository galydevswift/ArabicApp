//
//  SectionCLVCell.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 13/07/2023.
//

import UIKit

class SectionCLVCell: UICollectionViewCell {
    
    @IBOutlet weak var imgSection: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgSection.layer.cornerRadius = 15
    }

}
