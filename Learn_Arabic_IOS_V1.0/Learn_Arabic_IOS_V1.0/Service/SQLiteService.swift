//
//  SQLiteService.swift
//  Learn_Arabic_IOS_V1.0
//
//  Created by Vũ Ngọc Lâm on 13/07/2023.
//

import UIKit
import SQLite

class SQLiteService: NSObject {
    
    static let shared:SQLiteService = SQLiteService()
    
    var dataCategory: [CategoryModel] = []
    var dataAnimalsSound: [AnimalsSoundModel] = []
    var dataChildrenStory: [ChildrenStoryModel] = []
    var dataSocialStory: [SocialStoryModel] = []
    var dataSectionPage: [SectionPageModel] = []
    
    var connection: Connection?
    
    override init() {
        let dbURL = Bundle.main.url(forResource: "data", withExtension: "db")!
        var newURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        newURL.appendPathComponent("data,db")
        do {
            if FileManager.default.fileExists(atPath: newURL.path) {
            }else {
                try FileManager.default.copyItem(atPath: dbURL.path, toPath: newURL.path)
            }
            print(newURL.path)
        } catch {
            print(error.localizedDescription)
        }
        do{
            connection = try Connection(newURL.path)
        } catch{
            connection = nil
            let nserr = error as NSError
            print("Cannot connect to Database. Error is: \(nserr), \(nserr.userInfo)")
        }
    }
    
    func getDataCategory() -> [CategoryModel]{
        let categories = Table("category")
        let id = Expression<Int64>("id")
        let name = Expression<String>("name")
        let english = Expression<String>("english")
        let first_raw = Expression<String>("first_raw")
        
        dataCategory.removeAll()
        
        if let connectionData = connection{
            do{
                for category in try connectionData.prepare(categories) {
                    var itemAdd:CategoryModel = CategoryModel()
                    itemAdd = itemAdd.initCategoryModel(id: Int(category[id]), name: category[name], english: category[english], first_raw: category[first_raw])
                    dataCategory.append(itemAdd)
                }
            } catch  {
                print(error)
            }
        }
//        print(dataCategory)
        return dataCategory
    }
    
    func getDataAnimalsSound() -> [AnimalsSoundModel]{
        let animalsSound = Table("animals")
        let id = Expression<Int64>("id")
        let name = Expression<String>("name")
        let name_sound = Expression<String>("name_sound")
        let mp3 = Expression<String>("mp3")
        
        dataAnimalsSound.removeAll()
        
        if let connectionData = connection{
            do{
                for animal in try connectionData.prepare(animalsSound){
                    var itemAdd:AnimalsSoundModel = AnimalsSoundModel()
                    itemAdd = itemAdd.initAnimalsSoundModel(id: Int(animal[id]), name: animal[name], name_sound: animal[name_sound], mp3: animal[mp3])
                    dataAnimalsSound.append(itemAdd)
                }
            }catch{
                print(error)
            }
        }
        return dataAnimalsSound
    }
    func getDataChildrenStory() -> [ChildrenStoryModel]{
        let childrenStory = Table("SCategory")
        let id = Expression<Int64>("id")
        let name = Expression<String>("name")
        let img = Expression<String>("img")
        
        dataChildrenStory.removeAll()
        
        if let connectionData = connection{
            do{
                for children in try connectionData.prepare(childrenStory){
                    var itemAdd:ChildrenStoryModel = ChildrenStoryModel()
                    itemAdd = itemAdd.initChildrenStoryModel(id: Int(children[id]), name: children[name], img: children[img])
                    dataChildrenStory.append(itemAdd)
                }
            }catch{
                print(error)
            }
        }
        return dataChildrenStory
    }
    func getDataSocialStory() -> [SocialStoryModel]{
        let socialStory = Table("story")
        let id = Expression<Int64>("id")
        let id_cat = Expression<String>("id_cat")
        let name = Expression<String>("name")
        let stories = Expression<String>("story")
        
        dataSocialStory.removeAll()
        
        if let connectionData = connection{
            do{
                for storys in try connectionData.prepare(socialStory){
                    var itemAdd:SocialStoryModel = SocialStoryModel()
                    itemAdd = itemAdd.initSocialStoryModel(id: Int(storys[id]), id_cat: storys[id_cat], name: storys[name], story: storys[stories])
                    if itemAdd.id_cat == DataPassing.shared.socialStoryIDcat{
                        dataSocialStory.append(itemAdd)
                    }
                    
                }
            }catch{
                print(error)
            }
        }
        return dataSocialStory
    }
    func getDataSectionPage() -> [SectionPageModel]{
        let sectionPage = Table("lesson")
        let id = Expression<Int64>("id")
        let id_cat = Expression<Int64>("id_cat")
        let img = Expression<String>("img")
        let word = Expression<String>("word")
        let raw = Expression<String>("raw")
        let type = Expression<Int64>("type")
        
        dataSectionPage.removeAll()
        
        if let connectionData = connection{
            let i = Int(DataPassing.shared.socialStoryIDcat)
            do{
                for sections in try connectionData.prepare(sectionPage){
                    var itemAdd:SectionPageModel = SectionPageModel()
                    itemAdd = itemAdd.initSectionPageModel(id: Int(sections[id]), id_cat: Int(sections[id_cat]), img: sections[img], word: sections[word], raw: sections[raw], type: Int(sections[type]))
                    if itemAdd.id_cat == i {
                        dataSectionPage.append(itemAdd)
                  }
          //          dataSectionPage.append(itemAdd)
                }
            }catch{
                print(error)
            }
        }
        return dataSectionPage
    }
}
