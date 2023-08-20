//
//  Fonts.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 19/08/2023.
//

import Foundation
import UIKit
enum FontName: String {
    // ---------------English Fonts---------------------
    case BOLD_FONT = "Lato-Bold"
    case SEMIBOLD_FONT = "Rubik-SemiBold"
    case REGULAR_FONT = "Lato-Regular"
    case LATO_MEDIUM_FONT = "Lato-Medium"
    case MEDIUM_FONT = "Rubik-Medium"
}

class  Fonts {

    private static func fontPathRegular() -> FontName {
        if Language.currentLanguage().contains(AR_LANG) {
            return .REGULAR_FONT
        } else if Language.currentLanguage().contains(EN_LANG) {
            return .REGULAR_FONT
        } else {
            return .REGULAR_FONT
        }
    }

    private static func fontPathmeduim() -> FontName {
        if Language.currentLanguage().contains(AR_LANG) {
            return .MEDIUM_FONT
        } else if Language.currentLanguage().contains(EN_LANG) {
            return .MEDIUM_FONT
        } else {
            return .MEDIUM_FONT
        }
    }

    private static func fontPathSemiBold() -> FontName {
        if Language.currentLanguage().contains(AR_LANG) {
            return .BOLD_FONT
        } else if Language.currentLanguage().contains(EN_LANG) {
            return .BOLD_FONT
        } else {
            return .BOLD_FONT
        }
    }

    private static func fontPathBold() -> FontName {
        if Language.currentLanguage().contains(AR_LANG) {
            return .BOLD_FONT
        } else if Language.currentLanguage().contains(EN_LANG) {
            return .BOLD_FONT
        } else {
            return .BOLD_FONT
        }
    }
}
