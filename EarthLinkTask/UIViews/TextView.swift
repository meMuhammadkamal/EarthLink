//
//
//  TextView.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 18/08/2023.
//

import SwiftUI

struct TextView: View {
    var titleName: String
    var colorCode: Color
    var fontSize: Int
    var fontFamilyName: String
    var body: some View {
        Text(titleName)
            .foregroundColor( colorCode)
            .font(.custom(fontFamilyName, size: CGFloat(fontSize)))
    }
}
