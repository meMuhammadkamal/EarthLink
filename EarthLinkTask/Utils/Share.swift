//
//  Share.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 19/08/2023.
//

import Foundation
import UIKit
class Share {
 class func actionSheet(url:String) {
        guard let urlShare = URL(string:url) else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.keyWindowInConnectedScenes?.rootViewController?.present(activityVC, animated: true)
     }
}
