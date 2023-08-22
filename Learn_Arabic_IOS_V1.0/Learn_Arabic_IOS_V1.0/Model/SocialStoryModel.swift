//
//  SocialStory.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 17/07/2023.
//

import UIKit

class SocialStoryModel: NSObject {
    var id: Int = 0
    var id_cat: String = ""
    var name: String = ""
    var story: String = ""
    
    func initSocialStoryModel(id: Int,id_cat: String,name: String,story: String) -> SocialStoryModel{
        self.id = id
        self.id_cat = id_cat
        self.name = name
        self.story = story
        
        return self
    }
}
