//
//  StoryLineVCL.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 20/07/2023.
//

import UIKit

class StoryLineVCL: UIViewController {
    
    @IBOutlet weak var lblStoryLine: UILabel!
    @IBOutlet weak var tStoryLine: UITextView!
    @IBOutlet weak var btnBack: UIButton!
    
    @IBAction func backStoryLine(){
        self.dismiss(animated: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        lblStoryLine.text = DataPassing.shared.titleStoryLine
        tStoryLine.text = DataPassing.shared.storyLine
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        btnBack.setBackgroundImage(UIImage(named: "backSettings"), for: .normal)
        lblStoryLine.adjustsFontSizeToFitWidth = true
        lblStoryLine.minimumScaleFactor = 0.6
    }
}
