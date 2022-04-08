//
//  MapSwiftUIViewModel.swift
//  SixtApp
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import Foundation
import SwiftUI
import SixtFeed

class MapViewModel : ObservableObject {
    let resourceLoader :CarsMainResourceLoader<[RemoteCarItem]>

    init(resourceLoader: CarsMainResourceLoader<[RemoteCarItem]>) {
        self.resourceLoader = resourceLoader
    }
}
