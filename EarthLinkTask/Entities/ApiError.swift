//
//
//  ApiError.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 18/08/2023.
//

import Foundation
struct ApiError: Error, Equatable {
    var message = genericError
    var code: Int = 0
}
