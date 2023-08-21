//
//  AppModel.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 14/02/2023.
//  Copyright © 2023 Weight Watchers. All rights reserved.
//

import Foundation

struct AppDataModel : Codable, Equatable {
    let MustPlay : [AppModel]?
    let TopApps : [AppModel]?
    let EditorsChoice : [AppModel]?
    let AppOfTheDay : [AppModel]?
}

struct AppModel : Codable, Equatable {
    let name : String
    let avatar : String
    let id : String
    let description : String
    let ratingCount : String
    let rating : String
    let age : String
    let url : String
    init(name: String = "", avatar: String = "", id: String = "", description: String = "", url: String = "", ratingCount:String = "", rating:String = "", age:String = "") {
        self.name = name
        self.avatar = avatar
        self.id = id
        self.description = description
        self.url = url
        self.age = age
        self.rating = rating
        self.ratingCount = ratingCount
    }
}
