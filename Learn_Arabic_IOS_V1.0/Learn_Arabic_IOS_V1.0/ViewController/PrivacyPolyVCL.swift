//
//  PrivacyPolyVCL.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 01/08/2023.
//

import UIKit

class PrivacyPolyVCL: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBAction func backApp(){
        self.dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.adjustsFontSizeToFitWidth = true
        lblTitle.minimumScaleFactor = 0.6
    }
}
