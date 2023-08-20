//
//  Language.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 19/08/2023.
//

import Foundation
import UIKit
import SwiftUI

class Language {
    class func currentLanguage() -> String {
        let def = LocalStorage.sharedInstance.defaults
        let lang = def.object(forKey: "AppleLanguages") as? NSArray
        let firstLang = lang?.firstObject as? String
        return firstLang ?? ""
    }

    class func setAppLanguage(lang: String) {
        let def = LocalStorage.sharedInstance.defaults
        def.set([lang, currentLanguage()], forKey: "AppleLanguages")
        def.synchronize()
    }

    class func changeLanguage(selection: String) {
        Language.setAppLanguage(lang: selection)
    }
}


func checkLanguageAndnavigateHome() {
    let currentLanguage = Language.currentLanguage()
    if let window = UIApplication.shared.windows.first {
        if currentLanguage == AR_LANG {
            window.rootViewController = UIHostingController(rootView: AppListUIView(searchText: "", placeholder: .constant("")).environment(\.layoutDirection, .rightToLeft))

        } else {
            window.rootViewController = UIHostingController(rootView: AppListUIView(searchText: "", placeholder: .constant(""))
                .environment(\.layoutDirection, .leftToRight))
        }
        window.makeKeyAndVisible()
    }
}


func navigateToSplash() {
    let currentLanguage = Language.currentLanguage()
    if let window = UIApplication.shared.windows.first {
        if currentLanguage == AR_LANG {
            window.rootViewController = UIHostingController(rootView: SplashUIView().environment(\.layoutDirection, .rightToLeft))

        } else {
            window.rootViewController = UIHostingController(rootView: SplashUIView()
                .environment(\.layoutDirection, .leftToRight))
        }
        window.makeKeyAndVisible()
    }
}
