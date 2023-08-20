//
//
//  Result.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 18/08/2023.
//



import Foundation

enum Result<Value, Error: Swift.Error> {
    case success(Value)
    case failure(Error)
}
