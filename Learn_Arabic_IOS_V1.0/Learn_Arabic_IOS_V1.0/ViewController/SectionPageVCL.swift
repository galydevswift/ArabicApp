//
//  SectionPageVCL.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 20/07/2023.
//

import UIKit
import AVFoundation

class SectionPageVCL: UIViewController {
    
    var dataSectionPage: [SectionPageModel] = [SectionPageModel]()
    var player: AVAudioPlayer!
    var sound: Int = 0
    
    @IBOutlet weak var titleSection: UILabel!
    @IBOutlet weak var sectionCLV: UICollectionView!
    @IBOutlet weak var btnBackSection: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnReturn: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    @IBAction func backSectionPage(){
        self.dismiss(animated: true)
    }
    
    @IBAction func nextSection(){
        let visibleItems: NSArray = self.sectionCLV.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item + 1,
                                            section: 0)
        if nextItem.row < dataSectionPage.count {
            self.sectionCLV.scrollToItem(at: nextItem,
                                         at: .centeredHorizontally,
                                         animated: true)
        }
    }
    @IBAction func returnSection(){
        let visibleItems: NSArray = self.sectionCLV.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item - 1,
                                            section: 0)
        if nextItem.row > -1 {
            self.sectionCLV.scrollToItem(at: nextItem,
                                         at: .centeredHorizontally,
                                         animated: true)
        }
    }
    @IBAction func playerSound(){
        let visibleItems: NSArray = self.sectionCLV.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item,
                                            section: 0)
        let name = dataSectionPage[nextItem[1]].raw
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: name, ofType: "mp3") ?? "")
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print(error)
        }
    }
    @IBAction func backReturn(){
        let nextItem: IndexPath = IndexPath(item: Int.random(in: 0..<dataSectionPage.count),
                                            section: 0)
            self.sectionCLV.scrollToItem(at: nextItem,
                                         at: .centeredHorizontally,
                                         animated: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        titleSection.text = DataPassing.shared.titleSocialStory
        if DataPassing.shared.socialStoryIDcat == "1" || DataPassing.shared.socialStoryIDcat == "2" || DataPassing.shared.socialStoryIDcat == "3" || DataPassing.shared.socialStoryIDcat == "4"{
            sectionCLV.register(UINib(nibName: "SectionPageCLVCell", bundle: nil), forCellWithReuseIdentifier: "SectionPageCLVCell")
            dataSectionPage = SQLiteService.shared.getDataSectionPage()
            sectionCLV.reloadData()
        }else{
            sectionCLV.register(UINib(nibName: "SectionPageImgCLVCell", bundle: nil), forCellWithReuseIdentifier: "SectionPageImgCLVCell")
            dataSectionPage = SQLiteService.shared.getDataSectionPage()
            sectionCLV.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        btnBackSection.setBackgroundImage(UIImage(named: "backSettings"), for: .normal)
        btnBack.setBackgroundImage(UIImage(named: "Back"), for: .normal)
        btnPlay.setBackgroundImage(UIImage(named: "Pause"), for: .normal)
        btnReturn.setBackgroundImage(UIImage(named: "Random"), for: .normal)
        btnNext.setBackgroundImage(UIImage(named: "Next"), for: .normal)
        titleSection.adjustsFontSizeToFitWidth = true
        titleSection.minimumScaleFactor = 0.6
    }
}

extension SectionPageVCL: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSectionPage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if DataPassing.shared.socialStoryIDcat == "1" || DataPassing.shared.socialStoryIDcat == "2" || DataPassing.shared.socialStoryIDcat == "3" || DataPassing.shared.socialStoryIDcat == "4"{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionPageCLVCell", for: indexPath) as! SectionPageCLVCell
            cell.lblImg.text = dataSectionPage[indexPath.row].img
            cell.lblWord.text = dataSectionPage[indexPath.row].word
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionPageImgCLVCell", for: indexPath) as! SectionPageImgCLVCell
            cell.lblSection.text = dataSectionPage[indexPath.row].word
            cell.imgSectionPage.image = UIImage(named: dataSectionPage[indexPath.row].img)
            cell.lblSection.text = dataSectionPage[indexPath.row].word
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        return UICollectionReusableView()
    }
    
}

extension SectionPageVCL: UICollectionViewDelegateFlowLayout {
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
        print(indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .pad{
            return CGSize(width: collectionView.frame.width,
                          height: collectionView.frame.height)
        }
        return CGSize(width: collectionView.frame.width ,
                      height: collectionView.frame.height)
    }
}










////
////  SectionPageVCL.swift
////  Learn_Arabic_IOS_V1.0
////
////  Created by Vũ Ngọc Lâm on 20/07/2023.
////
//
//import UIKit
//import AVFoundation
//
//class SectionPageVCL: UIViewController {
//    @IBOutlet weak var sectionCLVs: UICollectionView!
//
//    var dataSectionPage: [SectionPageModel] = [SectionPageModel]()
//    var player: AVAudioPlayer!
//    var show:Bool = true
////    var sound: Int = 0
//
//    @IBOutlet weak var titleSection: UILabel!
//
//
//    @IBAction func playerSound(){
//        let visibleItems: NSArray = self.sectionCLVs.indexPathsForVisibleItems as NSArray
//               let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
//               let nextItem: IndexPath = IndexPath(item: currentItem.item,
//                                                   section: 0)
//        print(visibleItems)
////                print(currentItem)
////                print(nextItem)
//               let name = dataSectionPage[nextItem[1]].raw
//               let url = URL(fileURLWithPath: Bundle.main.path(forResource: name, ofType: "mp3") ?? "")
//               do{
//                   player = try AVAudioPlayer(contentsOf: url)
//                   player?.play()
//               } catch {
//                   print(error)
//               }
////        let visibleItems: NSArray = self.sectionCLV.indexPathsForVisibleItems as NSArray
////        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
////        let nextItem: IndexPath = IndexPath(item: currentItem.item,
////                                            section: 0)
////        print(visibleItems)
////        print(currentItem)
////        print(nextItem)
////        let name = dataSectionPage[nextItem[1]].raw
////        let url = URL(fileURLWithPath: Bundle.main.path(forResource: name, ofType: "mp3") ?? "")
////        do{
////            player = try AVAudioPlayer(contentsOf: url)
////            player?.play()
////        } catch {
////            print(error)
////        }
//    }
//    @IBAction func backSectionPage(){
//        self.dismiss(animated: true)
//    }
//
////    @IBAction func nextSection(){
////        let visibleItems: NSArray = self.sectionCLV.indexPathsForVisibleItems as NSArray
////        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
////        let nextItem: IndexPath = IndexPath(item: currentItem.item,
////                                            section: 0)
////        if nextItem.row < dataSectionPage.count {
////            self.sectionCLV.scrollToItem(at: nextItem,
////                                         at: .centeredHorizontally,
////                                         animated: true)
////        }
////    }
////    @IBAction func returnSection(){
////        let visibleItems: NSArray = self.sectionCLV.indexPathsForVisibleItems as NSArray
////        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
////        let nextItem: IndexPath = IndexPath(item: currentItem.item - 1,
////                                            section: 0)
////        if nextItem.row > -1 {
////            self.sectionCLV.scrollToItem(at: nextItem,
////                                         at: .centeredHorizontally,
////                                         animated: true)
////        }
////    }
////
////    @IBAction func backReturn(){
////        let nextItem: IndexPath = IndexPath(item: 0,
////                                            section: 0)
////            self.sectionCLV.scrollToItem(at: nextItem,
////                                         at: .centeredHorizontally,
////                                         animated: true)
////    }
//
//    override func viewWillAppear(_ animated: Bool) {
//    //    titleSection.text = DataPassing.shared.titleSocialStory
////        if DataPassing.shared.socialStoryIDcat == "1" || DataPassing.shared.socialStoryIDcat == "2" || DataPassing.shared.socialStoryIDcat == "3" || DataPassing.shared.socialStoryIDcat == "4"{
////            sectionCLVs.register(UINib(nibName: "SectionPageCLVCell", bundle: nil), forCellWithReuseIdentifier: "SectionPageCLVCell")
////            dataSectionPage = SQLiteService.shared.getDataSectionPage()
//            //      sectionCLV.reloadData()
//   //     }else{
////            sectionCLV.register(UINib(nibName: "SectionPageImgCLVCell", bundle: nil), forCellWithReuseIdentifier: "SectionPageImgCLVCell")
////            dataSectionPage = SQLiteService.shared.getDataSectionPage()
//            //     sectionCLV.reloadData()
// //       }
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        sectionCLVs.register(UINib(nibName: "SectionPageCLVCell", bundle: nil), forCellWithReuseIdentifier: "SectionPageCLVCell")
//        dataSectionPage = SQLiteService.shared.getDataSectionPage()
//        sectionCLVs.reloadData()
//        sectionCLVs.reloadData()
//    }
//}
//
//extension SectionPageVCL: UICollectionViewDelegate, UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.dataSectionPage.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        if DataPassing.shared.socialStoryIDcat == "1" || DataPassing.shared.socialStoryIDcat == "2" || DataPassing.shared.socialStoryIDcat == "3" || DataPassing.shared.socialStoryIDcat == "4"{
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionPageCLVCell", for: indexPath) as! SectionPageCLVCell
//            cell.lblImg.text = dataSectionPage[indexPath.row].img
//            cell.lblWord.text = dataSectionPage[indexPath.row].word
//            return cell
////        }else{
////            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionPageImgCLVCell", for: indexPath) as! SectionPageImgCLVCell
////            cell.lblSection.text = dataSectionPage[indexPath.row].word
////            cell.imgSectionPage.image = UIImage(named: dataSectionPage[indexPath.row].img)
////            cell.lblSection.text = dataSectionPage[indexPath.row].word
////            return cell
////        }
//
//
//    }
//    func collectionView(_ collectionView: UICollectionView,
//                        viewForSupplementaryElementOfKind kind: String,
//                        at indexPath: IndexPath) -> UICollectionReusableView {
//
//        return UICollectionReusableView()
//    }
//
//}
//
//extension SectionPageVCL: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return .zero
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath.row)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//     //   let count = self.dataAnimalsSound.count
//        if UIDevice.current.userInterfaceIdiom == .pad{
//            return CGSize(width: UIScreen.main.bounds.width / 4 - 10, height: 100)
//        }
//        return CGSize(width: 314 , height: 260)
//    }
//}
