//
//  RequestsInterceptor.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 19/08/2023.
//

import Foundation

import Foundation
import Alamofire

class RequestsInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request  = urlRequest
        request.headers.update(.accept("application/json"))
        request.headers.update(.contentType("application/json"))

        completion(.success(request))
    }

}
