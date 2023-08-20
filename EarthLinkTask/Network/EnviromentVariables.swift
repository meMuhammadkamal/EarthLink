//
//
//  EnvironmentVariables.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 18/08/2023.
//


import Foundation
enum EnvironmentVariables: String {
    case staging
    case production

    var baseURL: String {
        switch self {
        case .staging: return baseURLPath
        case .production: return baseURLPath
        }
    }
}

enum Version: String {
    case version1 = "v1/"
    case version2 = "v2/"
    var versionPath: String {
        switch self {
            case .version1: return Version.version1.rawValue
            case .version2: return Version.version2.rawValue
        }
    }
}
