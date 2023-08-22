//
//  AboutUSCVL.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 27/07/2023.
//

import UIKit
import WebKit

class AboutUSCVL: UIViewController {

    @IBOutlet weak var myWeb: WKWebView!
    @IBAction func backWeb(){
        self.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://thinkdiff.us/?fbclid=IwAR1EaTsE-gO2Hmu-5SXBK4em6cQQ2w2zrAkGt5PFDUxmwuMkaIXxOsHQj3A")
        let request = URLRequest(url: url!)
        myWeb.load(request)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
