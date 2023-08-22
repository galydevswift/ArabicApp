//
//  SectionPageModel.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 20/07/2023.
//

import UIKit

class SectionPageModel: NSObject {
    var id:Int = 0
    var id_cat:Int = 0
    var img:String = ""
    var word:String = ""
    var raw:String = ""
    var type:Int = 0
    
    func initSectionPageModel(id: Int,id_cat: Int,img: String,word: String,raw: String,type: Int) -> SectionPageModel{
        self.id = id
        self.id_cat = id_cat
        self.img = img
        self.word = word
        self.raw = raw
        self.type = type
        
        return self
    }
}
