//
//
//  Configuration.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 18/08/2023.
//


import Foundation
import UIKit
struct Configuration {
    lazy var environment: EnvironmentVariables = {
        if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            if configuration.contains("staging") {
                return EnvironmentVariables.staging
            }
            print(configuration)
        }

        return EnvironmentVariables.production
    }()
}
