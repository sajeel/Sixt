//
//  MapViewModel.swift
//  SixtApp
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import Foundation
import Combine
import SixtFeed

final class CarsMainResourceLoader<Resource>{
    let loader: () -> AnyPublisher<Resource, Error>
    private var cancellable: Cancellable?
    private var isLoading = false
    
    @Published var dataSource: [RemoteCarItem] = []
    
    init(loader: @escaping () -> AnyPublisher<Resource, Error>) {
        self.loader = loader
    }
    
    func loadResource() {
        guard !isLoading else { return }
        
        //presenter?.didStartLoading()
        isLoading = true
        
        cancellable = loader()
            .dispatchOnMainQueue()
            .handleEvents(receiveCancel: { [weak self] in
                self?.isLoading = false
            })
            
            .sink(
                receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .finished:
                        print("Finished")
                        break
                        
                    case let .failure(error):
                        print(error)
                        //self?.presenter?.didFinishLoading(with: error)
                    }
                    
                    self?.isLoading = false
                }, receiveValue: { [weak self] resource in
                    //print(resource)
                    //self?.presenter?.didFinishLoading(with: resource)
                    self?.dataSource = resource as! [RemoteCarItem]
                })
    }
    
}
