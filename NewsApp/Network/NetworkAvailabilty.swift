//
//  NetworkAvailabilty.swift
//  NewsApp
//
//  Created by Ahmed on 12/12/2023.
//
import Network

enum ConnectionStatus {
    case connected, disconnected
}

class NetworkMonitor {
    let monitor = NWPathMonitor()
    var isConnected: Bool = false
    
    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            if path.status == .satisfied {
                self?.isConnected = true
            } else {
                self?.isConnected = false
            }
        }
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
    
    func getConnectionStatus() -> ConnectionStatus {
        return isConnected ? .connected : .disconnected
    }
}


