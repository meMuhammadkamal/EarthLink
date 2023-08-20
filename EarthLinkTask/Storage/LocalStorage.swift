//
//  Language.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 19/08/2023.
//

import Foundation
import Foundation
class LocalStorage {
    static let sharedInstance = LocalStorage()
    let defaults = UserDefaults.standard
    var language: String { get { return defaults.string(forKey: LANGUAGE ) ?? "" } set { defaults.set(newValue, forKey: LANGUAGE)  } }
}
