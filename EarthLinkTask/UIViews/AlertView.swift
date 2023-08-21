//
//
//  AlertView.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 18/08/2023.
//

import SwiftUI

struct AlertView: ViewModifier {
    @Binding var showAlert: Bool
    let title: String
    let message: String
    let actionName: String
    var callback: () -> Void = {}
    func body(content: Content) -> some View {
            content
                    .alert(isPresented: $showAlert) { () -> Alert in
                        Alert(title: Text(title), message: Text(message),dismissButton: .default(Text(actionName)))
                     }
    }
}
