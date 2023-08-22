//
//  SectionHeaderCLVCell.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 31/07/2023.
//

import UIKit

class SectionHeaderCLVCell: UICollectionReusableView {

    @IBOutlet weak var imgHeaderSection: UIImageView!
//    @IBOutlet weak var lblHeaderSection: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
  //      lblHeaderSection.unsafelyUnwrapped
    }
    
}

//extension UILabel {
//
//    func underline() {
//        if let textString = self.text {
//            let attributedString = NSMutableAttributedString(string: textString)
//            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
//            attributedText = attributedString
//        }
//    }
//}
