//
//  CategoryModel.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 13/07/2023.
//

import UIKit

class CategoryModel: NSObject {
    var id: Int = 0
    var name: String = ""
    var english: String = ""
    var first_raw: String = ""
    
    func initCategoryModel(id: Int,name: String,english: String,first_raw: String) -> CategoryModel{
        self.id = id
        self.name = name
        self.english = english
        self.first_raw = first_raw
        
        return self
    }
}
