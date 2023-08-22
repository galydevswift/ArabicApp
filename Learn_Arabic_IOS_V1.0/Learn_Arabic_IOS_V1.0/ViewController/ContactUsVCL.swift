//
//  ContactUsVCL.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 01/08/2023.
//

import UIKit

class ContactUsVCL: UIViewController {

    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var btnCopy: UIButton!
    
    @IBAction func backContact(){
        self.dismiss(animated: true)
    }
    @IBAction func copyPress(sender: UIButton!){
        UIPasteboard.general.string = lblAddress.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblAddress.adjustsFontSizeToFitWidth = true
        lblAddress.minimumScaleFactor = 0.4
        setButtonTitleSize()
    }
    func setButtonTitleSize() {
            // Tính toán kích thước chữ dựa trên kích thước màn hình của thiết bị
            let screenWidth = UIScreen.main.bounds.width
            let titleFontSize = screenWidth * 0.15 // Tùy chỉnh tỷ lệ theo mong muốn

            // Đặt kích thước chữ cho button
            btnCopy.titleLabel?.font = UIFont.systemFont(ofSize: titleFontSize)
        }
}
