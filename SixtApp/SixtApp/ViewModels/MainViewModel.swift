//
//  MainViewModel.swift
//  SixtApp
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import Foundation
import SixtFeed
import os
import Combine

class MainViewModel {
    
    private lazy var scheduler: AnyDispatchQueueScheduler = DispatchQueue(
        label: "com.SIXTAPP.infra.queue",
        qos: .userInitiated,
        attributes: .concurrent
    ).eraseToAnyScheduler()
    
    private lazy var httpClient: HTTPClient = {
        URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))
    }()
    
    private lazy var logger = Logger(subsystem: "com.SIXTAPP", category: "main")

    private lazy var baseURL = URL(string: "https://cdn.sixt.io/codingtask/cars")!
    
    
    func makeRemoteCarsLoader() -> AnyPublisher<[RemoteCarItem], Error> {
        let url = CarsEndPoint.get.url(baseURL: baseURL)
        
        return httpClient
            .getPublisher(url: url)
            .tryMap(CarItemMapper.map)
            .eraseToAnyPublisher()
    }
}
