//
//  SocialStoryVCL.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 17/07/2023.
//

import UIKit

class SocialStoryVCL: UIViewController {
    
    var dataSocialStory: [SocialStoryModel] = [SocialStoryModel]()
    @IBOutlet weak var socialStoryCLV: UICollectionView!
    @IBOutlet weak var lblSocial: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    
    
    @IBAction func backSocial(){
        self.dismiss(animated: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        lblSocial.text = DataPassing.shared.titleSocialStory
        socialStoryCLV.register(UINib(nibName: "SocialStoryCLVCell", bundle: nil), forCellWithReuseIdentifier: "SocialStoryCLVCell")
        dataSocialStory = SQLiteService.shared.getDataSocialStory()
        socialStoryCLV.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        btnBack.setBackgroundImage(UIImage(named: "backSettings"), for: .normal)
        lblSocial.adjustsFontSizeToFitWidth = true
        lblSocial.minimumScaleFactor = 0.6
    }
}

extension SocialStoryVCL: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSocialStory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SocialStoryCLVCell", for: indexPath) as! SocialStoryCLVCell
        cell.lblSocialID.text = String(indexPath.row + 1)
        cell.lblSocialName.text = dataSocialStory[indexPath.row].name
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        return UICollectionReusableView()
    }
    
}

extension SocialStoryVCL: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "StoryLine", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StoryLineVCL")
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(vc, animated: true, completion: nil)
        DataPassing.shared.titleStoryLine = dataSocialStory[indexPath.row].name
        DataPassing.shared.storyLine = dataSocialStory[indexPath.row].story
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .pad{
            return CGSize(width: collectionView.frame.width / 2 - 10,
                          height: collectionView.frame.height / 12)
        }
        return CGSize(width: collectionView.frame.width,
                      height: collectionView.frame.height / 9)
    }
}
