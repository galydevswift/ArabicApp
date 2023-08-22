//
//  AnimalsSoundVCL.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 14/07/2023.
//

import UIKit
import AVFoundation

class AnimalsSoundVCL: UIViewController {
    
    @IBOutlet weak var animalsCLV: UICollectionView!
    @IBOutlet weak var btnBackAnimal: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblName: UILabel!

    var dataAnimalsSound: [AnimalsSoundModel] = [AnimalsSoundModel]()
    var player: AVAudioPlayer!

    @IBAction func playerSound(){
        let visibleItems: NSArray = self.animalsCLV.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item,
                                            section: 0)
        let name = dataAnimalsSound[nextItem[1]].mp3
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: name, ofType: "mp3") ?? "")
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print(error)
        }
    }
    @IBAction func backAnimalsSound(){
        self.dismiss(animated: true)
    }
    @IBAction func nextAnimal(){
        let visibleItems: NSArray = self.animalsCLV.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item + 1,
                                            section: 0)
        if nextItem.row < dataAnimalsSound.count {
            self.animalsCLV.scrollToItem(at: nextItem,
                                         at: .centeredHorizontally,
                                         animated: true)
        }
    }
    @IBAction func returnAnimal(){
        let visibleItems: NSArray = self.animalsCLV.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item - 1,
                                            section: 0)
        if nextItem.row > -1 {
            self.animalsCLV.scrollToItem(at: nextItem,
                                         at: .centeredHorizontally,
                                         animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        btnBackAnimal.setBackgroundImage(UIImage(named: "backSettings"), for: .normal)
        btnBack.setBackgroundImage(UIImage(named: "Back"), for: .normal)
        btnPlay.setBackgroundImage(UIImage(named: "Pause"), for: .normal)
        btnNext.setBackgroundImage(UIImage(named: "Next"), for: .normal)
        animalsCLV.register(UINib(nibName: "AnimalsCLVCell", bundle: nil), forCellWithReuseIdentifier: "AnimalsCLVCell")
        dataAnimalsSound = SQLiteService.shared.getDataAnimalsSound()
        animalsCLV.reloadData()
        lblName.adjustsFontSizeToFitWidth = true
        lblName.minimumScaleFactor = 0.1
    }
}

extension AnimalsSoundVCL: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataAnimalsSound.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalsCLVCell", for: indexPath) as! AnimalsCLVCell
        let name: String = dataAnimalsSound[indexPath.row].mp3
        let detail: String = ".png"
        let names: String = name + detail
        cell.imgAnimals.image = UIImage(named: names)
        cell.lblAnimals.text = dataAnimalsSound[indexPath.row].name
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        return UICollectionReusableView()
    }
    
}

extension AnimalsSoundVCL: UICollectionViewDelegateFlowLayout {
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
 //       print(indexPath.row)
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
