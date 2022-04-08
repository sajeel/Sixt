//
//  FlippingViewModel.swift
//  SixtApp
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import Foundation
import SwiftUI

class FlippingViewModel: ObservableObject {
   var mapViewModel : MapViewModel
    var carsListingViewModel : CarsListingViewModel
    
    init(mapViewModel: MapViewModel , carsListingViewModel : CarsListingViewModel){
        self.mapViewModel = mapViewModel
        self.carsListingViewModel = carsListingViewModel
    }
}
