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
        return Strings.getText(stringKey: self)
    }
}

