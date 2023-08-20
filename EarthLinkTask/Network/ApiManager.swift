//
//
//  ApiManager.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 18/08/2023.
//


import Foundation
import Alamofire
class ApiManager {
    static let sharedInstance = ApiManager()
    func fetchData<T: Decodable>(
        session: Session = Session.default, path: String, responseClass: T.Type, params: Parameters? = nil, method: HTTPMethod,
        encoding: ParameterEncoding = JSONEncoding.default,
        completion: @escaping (Result<T, ApiError>) -> Void) {

            let reachability = Reachability()
            reachability.monitorNetwork { isConnected in
                if isConnected {
                    session.session.configuration.timeoutIntervalForRequest = 10
                        print(path)
                    session.request(path,
                                    method: method,
                                    parameters: (params != nil) ? params : nil,
                                    encoding: encoding,
                                    headers: nil,
                                    interceptor: RequestsInterceptor(),
                                    requestModifier: nil)
                    .validate(statusCode:200..<400)
                    .responseString { response in
                        debugPrint(response)
                        do {
                            if let data = response.data {
                                let response  = try JSONDecoder().decode(T.self, from: data)
                                completion(.success(response))
                            }
                        } catch let error as NSError {
                            completion(.failure(ErrorHandler.generateError(description: error.description)))
                        }
                    }
                }else {
                    completion(.failure(ErrorHandler.generateError(description:  noInternet)))
                }
            }

        }
}
