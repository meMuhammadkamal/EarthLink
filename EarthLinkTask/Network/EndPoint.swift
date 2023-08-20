//
//
//  Endpoint.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 18/08/2023.
//

import Foundation

enum EndPoint {
    static var host: String = baseURLPath
    case apps
    var path: String {
        switch self {
        case .apps:
            return appsPath
        }
    }

    var urlString: String {
        EnvironmentVariables.staging.baseURL + Version.version1.versionPath + path
    }
}
