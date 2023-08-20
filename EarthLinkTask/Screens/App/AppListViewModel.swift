//
//
//  AppListViewModel.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 18/08/2023.
//


import Foundation
import Alamofire

// MARK: Retreive Collections list 
@MainActor
class AppListViewModel: ObservableObject {
    @Published var collections: [AppDataModel]?
    @Published var apiError: ApiError?
    
    func fetchList(completion: @escaping (Result<[AppDataModel], ApiError>) -> Void  = { _ in }) {
        let endpoint = EndPoint.apps.urlString
        ApiManager.sharedInstance.fetchData(path: endpoint, responseClass:[AppDataModel].self, method: .get) { result in
            switch result {
            case .success(let collections):
                self.collections = collections
                completion(result)
            case .failure(let error):
                self.apiError = error
                completion(result)
            }
        }
    }
}
