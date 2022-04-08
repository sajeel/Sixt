//
//  CarsEndPoint.swift
//  SixtFeed
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import Foundation

public enum CarsEndPoint {
    case get
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            var components = URLComponents()
            components.scheme = baseURL.scheme
            components.host = baseURL.host
            components.path = baseURL.path
            return components.url!
        }
    }
}
