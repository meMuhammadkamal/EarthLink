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
    let alertType: Int
    var callback: () -> Void = {}
    func body(content: Content) -> some View {
        if alertType == reloadAlert {
        content
                .alert(isPresented: $showAlert) { () -> Alert in
                    Alert(title: Text(title), message: Text(message),
                          primaryButton: .default(Text(actionName)) {
                        self.callback()
                    }, secondaryButton: .cancel(Text("cancel".localize)) {
                        showAlert.toggle()
                    })
                }
        }else {
            content
                    .alert(isPresented: $showAlert) { () -> Alert in
                        Alert(title: Text(title), message: Text(message),dismissButton: .default(Text(actionName)))
                     }
        }
    }
}
