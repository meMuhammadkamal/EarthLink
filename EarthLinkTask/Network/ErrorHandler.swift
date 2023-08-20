//
//
//  ErrorHandler.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 18/08/2023.
//


import Foundation

class ErrorHandler {
    static func generateError(description: String? =  genericError, errorCode: Int? = 400) -> ApiError {
        var error = ApiError()
        if let description = description, let errorCode = errorCode {
            error.message = description
            error.code = errorCode
        }
        return error
    }

}
