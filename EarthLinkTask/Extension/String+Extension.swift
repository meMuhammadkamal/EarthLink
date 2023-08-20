//
//  String+Extension.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 19/08/2023.
//

import Foundation
import SwiftUI
extension String {

    var localize: String {
//        return LocalizedStringKey(self).string()
        return Strings.getText(stringKey: self)
    }
    static func localizedString(for key: String,
                                  locale: Locale = .current) -> String {

        let language = locale.language.languageCode?.identifier
          let path = Bundle.main.path(forResource: language, ofType: "lproj")!
          let bundle = Bundle(path: path)!
          let localizedString = NSLocalizedString(key, bundle: bundle, comment: "")

          return localizedString
      }
}

extension LocalizedStringKey {
    var stringKey: String? {
           Mirror(reflecting: self).children.first(where: { $0.label == "key" })?.value as? String
    }
func string(locale: Locale = .current) -> String {
    return .localizedString(for: self.stringKey ?? "", locale: locale)
    }
}
