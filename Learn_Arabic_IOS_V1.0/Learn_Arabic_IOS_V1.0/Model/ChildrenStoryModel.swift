//
//  ChildrenStoryModel.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 16/07/2023.
//

import UIKit

class ChildrenStoryModel: NSObject {
    var id: Int = 0
    var name: String = ""
    var img: String = ""
    
    func initChildrenStoryModel(id: Int,name: String,img: String) -> ChildrenStoryModel{
        self.id = id
        self.name = name
        self.img = img
        
        return self
    }
}
