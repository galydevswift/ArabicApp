//
//  AnimalsSoundModel.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 15/07/2023.
//

import UIKit

class AnimalsSoundModel: NSObject {
    var id: Int = 0
    var name: String = ""
    var name_sound: String = ""
    var mp3: String = ""
    
    func initAnimalsSoundModel(id: Int,name: String,name_sound: String,mp3: String) -> AnimalsSoundModel{
        self.id = id
        self.name = name
        self.name_sound = name_sound
        self.mp3 = mp3
        
        return self
    }
}
