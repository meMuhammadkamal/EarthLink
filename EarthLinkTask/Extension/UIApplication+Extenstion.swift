//
//  UIApplication+Extenstion.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 19/08/2023.
//

import UIKit

extension UIApplication {
    var keyWindowInConnectedScenes: UIWindow? {
        let windowScenes: [UIWindowScene] = connectedScenes.compactMap({ $0 as? UIWindowScene })
        let windows: [UIWindow] = windowScenes.flatMap({ $0.windows })
        return windows.first(where: { $0.isKeyWindow })
    }

}
