//
//
//  Reachability.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 18/08/2023.
//


import Foundation
import Network

class Reachability {

    func monitorNetwork(completion: @escaping (Bool) -> Void) {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "monitoring")
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                switch path.status {
                case .satisfied:
                    completion(true)
                case .unsatisfied:
                    completion(false)
                case .requiresConnection:
                    completion(false)
                @unknown default:
                    completion(false)
                }
            }
        }
    }
}
