//
//  HomePageVCL.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 13/07/2023.
//

import UIKit

class HomePageVCL: UIViewController {

    @IBOutlet weak var sectionCLV:UICollectionView!
    @IBOutlet weak var btnSetting: UIButton!
    @IBOutlet weak var btnWrittingLetter: UIButton!
    @IBOutlet weak var btnWrittingNumber: UIButton!
    @IBOutlet weak var btnAnimalSsound: UIButton!
    @IBOutlet weak var btnChildrent: UIButton!
    
    var dataCategory: [CategoryModel] = [CategoryModel]()

//    @IBAction func writingNumber(){
//        DataPassing.shared.writeLetterNumber = true
//        let storyboard = UIStoryboard(name: "WritingPage", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "WritingPageVCL")
//        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
//        self.present(vc, animated: true, completion: nil)
//    }
//    @IBAction func writingLetter(){
//        DataPassing.shared.writeLetterNumber = false
//        let storyboard = UIStoryboard(name: "WritingPage", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "WritingPageVCL")
//        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
//        self.present(vc, animated: true, completion: nil)
//    }
//    @IBAction func childrenStor(){
//        let storyboard = UIStoryboard(name: "ChildrenStory", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "ChildrenStoryVCL")
//        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
//        self.present(vc, animated: true, completion: nil)
//    }
//    @IBAction func animalsSound(){
//        let storyboard = UIStoryboard(name: "AnimalsSound", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "AnimalsSoundVCL")
//        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
//        self.present(vc, animated: true, completion: nil)
//    }
    @IBAction func settingsbtn(){
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SettingsCLV")
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(vc, animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionCLV.register(
            UINib(nibName: "SectionCLVCell", bundle: nil),
            forCellWithReuseIdentifier: "SectionCLVCell")
        sectionCLV.register(
            UINib(nibName: "SectionHeaderCLVCell", bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "SectionHeaderCLVCell")
        dataCategory = SQLiteService.shared.getDataCategory()
        sectionCLV.reloadData()
    }
}

extension HomePageVCL: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0
        {
            return 4
        }
        else
        {
            return self.dataCategory.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionCLVCell", for: indexPath) as! SectionCLVCell
        if indexPath[0] == 0
        {
            let x = indexPath[1]
            switch x
            {
            case 0:
                cell.imgSection.image = UIImage(named: "WritingNumbers")
            case 1:
                cell.imgSection.image = UIImage(named: "WritingLetters")
            case 2:
                cell.imgSection.image = UIImage(named: "AnimalSounds")
            case 3:
                cell.imgSection.image = UIImage(named: "Children'sStories")
            default:
                return cell
            }
        }
        else
        {
            cell.imgSection.image = UIImage(named: dataCategory[indexPath.row].first_raw)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderCLVCell", for: indexPath) as? SectionHeaderCLVCell{
            if indexPath[0] == 0
            {
                sectionHeader.imgHeaderSection.image = UIImage(named: "Learn__")
            }
            else
            {
                sectionHeader.imgHeaderSection.image = UIImage(named: "Sections")
            }
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
}

extension HomePageVCL: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath[0] == 0
        {
            switch indexPath[1]
            {
            case 0:
                DataPassing.shared.writeLetterNumber = true
                let storyboard = UIStoryboard(name: "WritingPage", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "WritingPageVCL")
                vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
                self.present(vc, animated: true, completion: nil)
            case 1:
                DataPassing.shared.writeLetterNumber = false
                let storyboard = UIStoryboard(name: "WritingPage", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "WritingPageVCL")
                vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
                self.present(vc, animated: true, completion: nil)
            case 2:
                let storyboard = UIStoryboard(name: "AnimalsSound", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "AnimalsSoundVCL")
                vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
                self.present(vc, animated: true, completion: nil)
            case 3:
                let storyboard = UIStoryboard(name: "ChildrenStory", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ChildrenStoryVCL")
                vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
                self.present(vc, animated: true, completion: nil)
            default:
            print("error")
            }
        }
        else
        {
            let storyboard = UIStoryboard(name: "SectionPage", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "SectionPageVCL")
            vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
            self.present(vc, animated: true, completion: nil)
            DataPassing.shared.socialStoryIDcat = String(indexPath.row + 1)
            DataPassing.shared.titleSocialStory = dataCategory[indexPath.row].name
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath[0] == 0
        {
            if UIDevice.current.userInterfaceIdiom == .pad{
                return CGSize(width: UIScreen.main.bounds.width / 4 - 50,
                              height: UIScreen.main.bounds.height / 9)
            }
            return CGSize(width: UIScreen.main.bounds.width / 2 - 40,
                          height: UIScreen.main.bounds.height / 9 )
        }
        else
        {
            if UIDevice.current.userInterfaceIdiom == .pad{
                return CGSize(width: UIScreen.main.bounds.width / 4 - 50,
                              height: UIScreen.main.bounds.height / 9)
            }
            return CGSize(width: (collectionView.frame.width - 15) / 2 ,
                          height: UIScreen.main.bounds.height / 10)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width,
                      height: 40)
    }
}
