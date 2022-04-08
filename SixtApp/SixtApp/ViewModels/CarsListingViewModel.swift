//
//  CarsListingViewModel.swift
//  SixtApp
//
//  Created by Sajjeel Hussain Khilji on 09/04/2022.
//

import Foundation
import SixtFeed
import Combine


class CarsListingViewModel : ObservableObject {
    let resourceLoader :CarsMainResourceLoader<[RemoteCarItem]>
    @Published var cars: [RemoteCarItem] = []
    private var cancellable: Cancellable?
    
    init(resourceLoader: CarsMainResourceLoader<[RemoteCarItem]>) {
        self.resourceLoader = resourceLoader
        cancellable = self.resourceLoader.$dataSource.sink { [weak self] cars in
            self?.cars = cars
        }
    }
    
   
}
