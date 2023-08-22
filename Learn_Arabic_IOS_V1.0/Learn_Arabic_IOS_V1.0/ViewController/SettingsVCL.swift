//
//  SettingsCLV.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 14/07/2023.
//

import UIKit
import StoreKit

class SettingsVCL: UIViewController {

//    let bienSwitch:UserDefaults = UserDefaults()
//    let keySW1 = "on_key"
//    let keySW2 = "Hello"
    
//    @IBOutlet weak var sectionView1: UIView!
//    @IBOutlet weak var sectionView2: UIView!
//    @IBOutlet weak var sectionView3: UIView!
//    @IBOutlet weak var sectionView4: UIView!
//    @IBOutlet weak var sectionView5: UIView!
//    @IBOutlet weak var sw1: UISwitch!
//    @IBOutlet weak var sw2: UISwitch!
    @IBOutlet weak var btnback: UIButton!
    @IBOutlet weak var btnContactUs: UIButton!
    @IBOutlet weak var btnLikeApp: UIButton!
    @IBOutlet weak var btnShareApp: UIButton!
    @IBOutlet weak var btnPoly: UIButton!
    @IBOutlet weak var btnAbout: UIButton!
    @IBOutlet weak var lblName: UILabel!
    
    @IBAction func contactUS(){
        let storyboard = UIStoryboard(name: "ContactUs", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ContactUsVCL")
        vc.modalPresentationStyle = .formSheet //or .overFullScreen for transparency
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func sharedApp(){
        
    }
    
    @IBAction func likeApp(){
//        if #available(iOS 13.3, *) {
//            SKStoreReviewController.requestReview()
//
//        } else if let url = URL(string: "itms-apps://itunes.apple.com/app/" + "appId") {
//            if #available(iOS 13, *) {
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//
//            } else {
//                UIApplication.shared.openURL(url)
//            }
//        }
    }
    
    @IBAction func PrivacyPoly(){
        let storyboard = UIStoryboard(name: "PrivacyPoly", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PrivacyPolyVCL")
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func aboutApp(){
        let storyboard = UIStoryboard(name: "AboutUS", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AboutUSCVL")
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(vc, animated: true, completion: nil)
//    https://thinkdiff.us/?fbclid=IwAR1EaTsE-gO2Hmu-5SXBK4em6cQQ2w2zrAkGt5PFDUxmwuMkaIXxOsHQj3A
    }
    
//    @IBAction func sw1btn(_ sender: Any){
//        if sw1.isOn{
//            bienSwitch.set(true, forKey: keySW1)
//        } else {
//            bienSwitch.set(false, forKey: keySW1)
//        }
//    }
//    @IBAction func sw2btn(_ senfer: Any){
//        if sw1.isOn{
//            bienSwitch.set(true, forKey: keySW2)
// //           print(bienSwitch.bool(forKey: keySW2))
//        } else {
//            bienSwitch.set(false, forKey: keySW2)
////            print(bienSwitch.bool(forKey: keySW2))
//        }
//    }
    @IBAction func backSettings(){
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 //       print(bienSwitch.bool(forKey: keySW1))
 //       print(bienSwitch.bool(forKey: keySW2))
//        sectionView1.layer.cornerRadius = 10
//        sectionView2.layer.cornerRadius = 10
//        sectionView3.layer.cornerRadius = 10
//        sectionView4.layer.cornerRadius = 10
//        sectionView5.layer.cornerRadius = 10
        btnback.setBackgroundImage(UIImage(named: "backSettings"), for: .normal)
        btnContactUs.setBackgroundImage(UIImage(named: "contactUS"), for: .normal)
        btnShareApp.setBackgroundImage(UIImage(named: "share app"), for: .normal)
        btnLikeApp.setBackgroundImage(UIImage(named: "likeApp"), for: .normal)
        btnPoly.setBackgroundImage(UIImage(named: "privacyPoly"), for: .normal)
        btnAbout.setBackgroundImage(UIImage(named: "aboutApplication"), for: .normal)
        lblName.adjustsFontSizeToFitWidth = true
        lblName.minimumScaleFactor = 0.6
 //       checkSwitch()
    }
//    func checkSwitch()
//    {
//        if bienSwitch.bool(forKey: keySW1){
//            sw1.setOn(true, animated: false)
//        } else {
//            sw1.setOn(false, animated: false)
//        }
//        if bienSwitch.bool(forKey: keySW2){
//            sw2.setOn(true, animated: false)
//        } else {
//            sw2.setOn(false, animated: false)
//        }
//    }
}
