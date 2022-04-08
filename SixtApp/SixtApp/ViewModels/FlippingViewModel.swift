//
//  FlippingViewModel.swift
//  SixtApp
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import Foundation
import SwiftUI

class FlippingViewModel: ObservableObject {
   var mapSwiftUIViewModel : MapSwiftUIViewModel
    
    init(mapSwiftUIViewModel: MapSwiftUIViewModel ){
        self.mapSwiftUIViewModel = mapSwiftUIViewModel
    }
}
