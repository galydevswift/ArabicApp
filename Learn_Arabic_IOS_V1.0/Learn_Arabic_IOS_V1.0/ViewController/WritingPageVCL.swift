//
//  WritingPageVCL.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 23/07/2023.
//

import UIKit
import TouchDraw

class WritingPageVCL: UIViewController, TouchDrawViewDelegate {
    
    var x: Int = 1
    private static let deltaWidth = CGFloat(12.0)
    
    @IBOutlet weak var imgBackGround: UIImageView!
    @IBOutlet var drawView: TouchDrawView!
    @IBOutlet weak var btnback: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var btnClear: UIButton!
    
    @IBAction func backHome(){
        self.dismiss(animated: true)
    }
    @IBAction func clear(_ sender: AnyObject) {
           drawView.clearDrawing()
       }
    @IBAction func nextImg(){
        drawView.clearDrawing()
        if DataPassing.shared.writeLetterNumber == true {
            if x < 10 {
                x += 1
                imgBackGround.image = UIImage(named: String(x))
            }
        } else {
            if x < 28 {
                x += 1
                if x < 10 {
                    imgBackGround.image = UIImage(named: "snd_eng_0\(String(x))")
                } else {
                    imgBackGround.image = UIImage(named: "snd_eng_\(String(x))")
                }
            }
        }
    }
    @IBAction func returnImg(){
        drawView.clearDrawing()
        if DataPassing.shared.writeLetterNumber == true {
            if x > 1 {
                x -= 1
                imgBackGround.image = UIImage(named: String(x))
            }
        } else {
            if x > 1 {
                x -= 1
                if x < 10 {
                    imgBackGround.image = UIImage(named: "snd_eng_0\(String(x))")
                } else {
                    imgBackGround.image = UIImage(named: "snd_eng_\(String(x))")
                }
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        if UIDevice.current.userInterfaceIdiom == .phone{
            AppUtility.lockOrientation(.landscape, andRotateTo: .landscapeLeft)
        }
        else
        {
            AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        btnback.setBackgroundImage(UIImage(named: "BackWriter"), for: .normal)
        btnNext.setBackgroundImage(UIImage(named: "NextWriter"), for: .normal)
        btnHome.setBackgroundImage(UIImage(named: "Home"), for: .normal)
        btnClear.setBackgroundImage(UIImage(named: "TayXoa"), for: .normal)
        if DataPassing.shared.writeLetterNumber == true {
            imgBackGround.image = UIImage(named: String(x))
        } else {
            imgBackGround.image = UIImage(named: "snd_eng_0\(String(x))")
        }
        drawView.delegate = self
        drawView.setWidth(WritingPageVCL.deltaWidth)
    }
}
