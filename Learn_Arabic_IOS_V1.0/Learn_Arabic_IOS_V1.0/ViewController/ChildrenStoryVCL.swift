//
//  ChildrenStoryVCL.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 15/07/2023.
//

import UIKit

class ChildrenStoryVCL: UIViewController {
    
    @IBOutlet weak var childrenStoryCLV: UICollectionView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblName: UILabel!
    
    var dataChildrenStory: [ChildrenStoryModel] = [ChildrenStoryModel]()
    
    @IBAction func backChildrenStory(){
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnBack.setBackgroundImage(UIImage(named: "backSettings"), for: .normal)
        childrenStoryCLV.register(UINib(nibName: "ChildrenStoryCLVCell", bundle: nil), forCellWithReuseIdentifier: "ChildrenStoryCLVCell")
        dataChildrenStory = SQLiteService.shared.getDataChildrenStory()
        childrenStoryCLV.reloadData()
        lblName.adjustsFontSizeToFitWidth = true
        lblName.minimumScaleFactor = 0.6
    }
}

extension ChildrenStoryVCL: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataChildrenStory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChildrenStoryCLVCell", for: indexPath) as! ChildrenStoryCLVCell
        cell.imgChildrenStory.image = UIImage(named: dataChildrenStory[indexPath.row].img)
        cell.lblChildrent.text = dataChildrenStory[indexPath.row].name
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        return UICollectionReusableView()
    }
    
}

extension ChildrenStoryVCL: UICollectionViewDelegateFlowLayout {
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
        let storyboard = UIStoryboard(name: "SocialStory", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SocialStoryVCL")
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(vc, animated: true, completion: nil)
        DataPassing.shared.titleSocialStory = dataChildrenStory[indexPath.row].name
        DataPassing.shared.socialStoryIDcat = String(dataChildrenStory[indexPath.row].id)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if UIDevice.current.userInterfaceIdiom == .pad{
//            return CGSize(width: UIScreen.main.bounds.width / 4 - 10, height: 100)
//        }
//        return CGSize(width: collectionView.frame.width / 2 - 10, height: 135)
        if UIDevice.current.userInterfaceIdiom == .pad{
            return CGSize(width: collectionView.frame.width / 4 - 10,
                          height: collectionView.frame.height / 6)
        }
        return CGSize(width: collectionView.frame.width / 2 - 10 ,
                      height: collectionView.frame.height / 5)
    }
}
