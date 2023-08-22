//
//  SocialStoryCLVCell.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 18/07/2023.
//

import UIKit

class SocialStoryCLVCell: UICollectionViewCell {
    @IBOutlet weak var viewSocialStory: UIView!
    @IBOutlet weak var lblSocialID: UILabel!
    @IBOutlet weak var lblSocialName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        viewSocialStory.layer.cornerRadius = 10
    }

}
